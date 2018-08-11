library(reshape2)
library(dplyr)


##### Downloading the Data
if (!file.exists("getData.zip")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,"getData.zip", method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip("getData.zip") 
}

#### Reading Test Data
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)


#### Reading Train Data
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)


###### Reading Features
features <-  read.table("./UCI HAR Dataset/features.txt",header = FALSE)
features[,2] <- as.character(features[,2])

###### Reading Activity Labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)
activity[,2] <- as.character(activity[,2])

###### Filtering only required features and providing them with proper labels
reqFeatures <- grep('.*mean.*|.*std.*',features[,2])
reqFeaturesNames <- features[reqFeatures,2]
reqFeaturesNames <- gsub("mean","Mean",reqFeaturesNames)
reqFeaturesNames <- gsub("std","Std",reqFeaturesNames)
reqFeaturesNames <- gsub("[()-]","",reqFeaturesNames)

###### Filtering Data based on the conditions
xtest <- select(xtest,reqFeatures)
xtrain <- select(xtrain,reqFeatures)

###### Combining all Data
testData <- cbind(subjecttest,ytest,xtest)
trainData <- cbind(subjecttrain,ytrain,xtrain)

totalData <- rbind(trainData,testData)

colnames(totalData) <- c("subject","activity",reqFeaturesNames)

##### Label Activity as factors
totalData$activity <- factor(totalData$activity,levels = activity[,1],labels = activity[,2])
totalData$subject <- as.factor(totalData$subject)

meltData <- melt(totalData,id = c("subject","activity"))

meanData <- dcast(meltData,subject + activity ~ variable,mean)

###### Write in A file
write.table(meanData,file = "tidyData.txt",row.names = FALSE,quote = FALSE)


