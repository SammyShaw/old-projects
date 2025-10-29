library(dplyr)

# Set working directory
if(!file.exists("Datasets")){
        dir.create("Datasets")
}
setwd("Datasets")

# Download and unzip files
zipUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipUrl, destfile="SmartPhoneData.zip")
unzip(zipfile="SmartPhoneData.zip")

## Read data tables
trainX<-read.table("UCI HAR Dataset/train/X_train.txt")
trainY<-read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt")
testX<-read.table("UCI HAR Dataset/test/X_test.txt")
testY<-read.table("UCI HAR Dataset/test/y_test.txt")
testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt")

activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

## Label variables with names from 'features.txt'
colnames(trainX)=features[,2]
colnames(testX)=features[,2]
## Label 'Y' data, i.e., activity number
colnames(trainY)="activitynum"
colnames(testY)="activitynum"
## Label subject data, i.e., subject ID numbers
colnames(trainSubject)="subject"
colnames(testSubject)="subject"
## Label activities, prepare for merger along "activitynum"
colnames(activityLabels)=c("activitynum", "activity")

## Merge train and test data files, and ADD GROUP IDENTIFIER, because the data is obviously set up compare groups. 
trainset<-cbind(trainSubject, trainY, trainX)
trainset$group<-"train"
testset<-cbind(testSubject, testY, testX)
testset$group<-"test"
SPdata<-rbind(trainset, testset)

## Add activity labels, and arrange variables group, and subject up front
SPdata<-merge(activityLabels, SPdata, by="activitynum", all.x=TRUE); # manually inputting names would be tricky if more than six activities
SPdata<-select(SPdata, subject, -activitynum, group, 2:565); # activityId was useful for merging
SPdata<-arrange(SPdata, subject, activity); # My OCD; because subject is 1st, order by subject

## Select columns that deal with mean and SD using select()
SPselect<-select(SPdata, subject, group, activity, 
                 grep("mean..|Mean..", colnames(SPdata)),
                 grep("std..", colnames(SPdata)))

## Copy the dataframe to directory
write.table(SPselect, "SPselect.txt")

## Make a second, tiny tidy data set with average of each variable for each activity and each subject. 
activity_means<-sapply(split(SPselect[,4:86], SPselect$activity), colMeans)
subject_means<-sapply(split(SPselect[,4:86], SPselect$subject), colMeans)
SPavgs<-cbind(subject_means, activity_means)

## Copy the dataframe to directory
write.table(SPavgs, "SPavgs.txt")



