## Readme
This repository contains files related to the project for the Coursera course 'Getting and Cleaning Data'.

### Overview
The purpose of the project is to demonstrate the cleaning of messy data sets and produce one tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The source data for this project can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Details
The script run_analysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file CodeBook.md has the information about the variables, data and transformations.

To produce the tidy data set, download and unzip the data files from the link above, and place run_Analysis.R script in the base directory ('UCI HAR Dataset'). Set the working directory in R to this directory, and execute the script. The script requires the plyr package.

The output tidy data set can be read using read.table(header=TRUE) function. 