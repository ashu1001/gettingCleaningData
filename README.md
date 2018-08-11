# Getting and Cleaning Data Course Project

The script included run_analysis.R does the following functions:

- Downloads the data and puts it in the directory if it doesn't exists.
- Reads the data from both training and test data sets.
- Also read the files containing activity and features information.
- Filter the features so that it contains only mean and std and further modified the label names.
- Filter both the training and test datasets so that it contains only the required features.
- Combined all the data into one dataset.
- Create a separate dataset to include the mean of all measurements for each subject and activity.
- Write the content of dataset in file named "tidyData.txt".
