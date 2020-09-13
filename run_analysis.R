install.packages("reshape2")
library(reshape2)

#Reading info from row files
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainS <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testS <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

#Merging data by categories
mergedX <- rbind(trainX, testX)
mergedY <- rbind(trainY, testY)
mergedS <- rbind(trainS, testS)

#Extracting columns and names named "mean" and "std"
cols <- grep("-(mean|std).*", as.character(features[,2]))
colname <- features[cols, 2]
colname <- gsub("-mean", "Mean", colname)
colname <- gsub("-std", "Std", colname)
colname <- gsub("[-()]", "", colname)

#Extracting by columns
mergedX <- mergedX[cols]
general <- cbind(mergedS, mergedY, mergedX)
colnames(general) <- c("Subject", "Activity", colname)

general$Activity <- factor(general$Activity, levels = activity_labels[, 1],
                           labels = activity_labels[,2])
general$Subject <- as.factor(general$Subject)

#Generating tidy dataset
melted <- melt(general, id = c("Subject", "Activity"))
tidy <- dcast(melted, Subject + Activity ~ variable, mean)

names(tidy)[2] = "activity"
names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("Mag", "Magnitude", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))
names(tidy)<-gsub("tBody", "TimeBody", names(tidy))
names(tidy)<-gsub("-mean()", "Mean", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-std()", "STD", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-freq()", "Frequency", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("angle", "Angle", names(tidy))
names(tidy)<-gsub("gravity", "Gravity", names(tidy))

#Writing our result into file
write.table(tidy, "tidy.txt", quote = FALSE, row.names = FALSE)
