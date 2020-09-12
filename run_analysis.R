library(data.table)

trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainS <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testS <- read.table("./UCI HAR Dataset/test/subject_test.txt")

mergedX <- rbind(trainX, testX)
mergedY <- rbind(trainY, testY)
mergedS <- rbind(trainS, testS)

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

cols <- grep("-(mean|std).*", as.character(features[,2]))
colname <- features[cols, 2]
colname <- gsub("-mean", "Mean", colname)
colname <- gsub("-std", "Std", colname)
colname <- gsub("[-()]", "", colname)

mergedX <- mergedX[colname]
general <- cbind(mergedS, mergedY, mergedX)
colnames(general) <- c("Subject", "Activity", colname)

general$Activity <- factor(general$Activity, levels = activity_labels[, 1],
                           labels = activity_labels[,2])
general$Subject <- as.factor(ganeral$Subject)

melted <- melt(general, id = c("Subject", "Activity"))
tidy <- dcast(melted, Subject + Activity ~ variable, mean)

write.table(tidy, "tidy_data_set.txt", quote = FALSE, row.names = FALSE)