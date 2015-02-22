Getting and Cleaning Data - Course Project Codebook
====================================================

Project Data Set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script (run_analysis.R) clean up and organize the data as follows:

1) Merge the training and test sets to create one data set, the result is a data frame with subject ID, and activity ID.

2) Read and extract features.txt with only the measurements on the mean and standard deviation for each measurement. All measurements appear to be floating point numbers in the range (-1, 1).

3) Uses descriptive activity names to name the activities in the data set from the activity_labels.txt.

4) Appropriately labels the data set with descriptive variable names.
 

5) The script creates a 2nd, independent tidy data set, with the average of each measurement for each activity and each subject. Read and save the result as data_set_with_the_averages.txt.