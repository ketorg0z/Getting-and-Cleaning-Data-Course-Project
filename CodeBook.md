
---

# Getting and Cleaning Data

Raw data is taken from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), a full
description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Description of the solution of Course Project

The data is extracted from the .zip archive under the folder named "UCI HAR Dataset".

My script ([run_analysis.R](https://github.com/ketorg0z/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R)) assigns each data file to variables (features, testX, testY, testS etc.), merges train and test sets in one data set by the **rbind()** function, extracts only the measurements on the mean and standard deviation by the regular expressions, replaces codes with descriptive names of activities, labels the data set with descriptive variable names (such as Accelerometer, Gyroscope etc.) and creates a tidy data set named *tidy.txt*.

As a result we have a tidy dataset.

---
