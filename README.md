# Getting and Cleaning Data Course Project

## Introduction
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data source for the project is :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Script Description
The script included run_analysis.R does the following functions:

- Downloads the data and puts it in the directory if it doesn't exists.
- Reads the data from both training and test data sets.
- Also read the files containing activity and features information.
- Filter the features so that it contains only mean and std and further modified the label names.
- Filter both the training and test datasets so that it contains only the required features.
- Combined all the data into one dataset.
- Labels both activity and subject as factors.
- Create a separate dataset to include the mean of all measurements for each subject and activity.
- Write the content of dataset in file named "tidyData.txt".
