# GettingAndCleaningData
Coursera Peer graded course project for getting and cleaning data

## Included files
* README.md - you're looking at it
* CodeBook.md - describes the variables and data trasformations
* run_analysis.R - R script that creates a tidy data set

## run_analysis.R requirements
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each      subject.

## Working data set
A zip file containing the sample data was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It was extracted to the "./data/UCIHARDataset" directory.

## Cleaned data file
The processed data file will reside in ./data/tidy.txt.
