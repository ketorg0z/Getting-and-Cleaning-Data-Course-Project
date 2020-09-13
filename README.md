# Course Project for Getting And Cleaning Data Course

### Explanation
My script ([run_analysis.R](https://github.com/ketorg0z/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R)) assigns each data file to variables, merges train and test sets in one data set, extracts only the measurements on the mean and standard deviation by the regular expressions, replaces codes with descriptive names of activities, labels the data set with descriptive variable names and creates a tidy data set named *tidy.txt* in this repo.

*CodeBook.md* - a code book that describes the variables, the data and transformations or work that was performed to clean up the data.
*tidy.txt* - tidy dataset (result).
*ru_analysis.R* - my script, that cleans raw data into *tidy.txt*. 

Raw Data - [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), a full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
