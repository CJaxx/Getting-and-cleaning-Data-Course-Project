## You should create one R script called run_analysis.R that does the following. 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.


## Step 1 - get raw data and unzip it

    if(!file.exists("./HARdata")){dir.create("./HARdata")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="./HARdata/HARdata.zip")
    
    > setwd("D://Rdata/Coursera/HARdata/")
    
    
    ## check file is present and unzip 
    
    list.files()
    unzip("HARdata.zip")


    list.files("UCI HAR Dataset")

## Step 2 - read required text files into R for training set (70%)

    ## import activity names
##    
    ## import the data to identify the subject who performed the activity
    SubjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE )
    ## Import the training data (train/X_train.txt) and the labels for the dataset (train/y_train)
    TrainData <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
    TrainLabels <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
    
    

## Step 3 - read required text files for test set (30%)
    ## import the data to identify the subject who performed the activity    
    SubjTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
    TestData <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
    TestLabels <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
    
## Step 4 - merge datasets
    Data <- rbind(TrainData, TestData)
    Labels <- rbind(TrainLabels, TestLabels)
    Subjects <- rbind(SubjTrain, SubjTest)

## Step 5 - extract mean and std for each measurement     
    ## import list of all features
    features <- read.table("UCI HAR Dataset/features.txt", header=FALSE) 
    ## extract mean and std
    mean_std <- grep(".*mean.*|.*std.*", features[,2] )
    ## subset data by mean and std
    Data <- Data[, mean_std]
    names(Data) <- features[mean_std, 2]

## Step 5 - Use descriptive activity names (from the Activities Labels text file) to label the data
    ## read the data in
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE) 
    ## use the activity_labels to update the Labels variable/column names
    Labels[,1] <-activity_labels[Labels[,1], 2]
    names(Labels) <- "activity"
    
    names(Subjects) <- "subject"
    
## Step 6 - Create a new tidy dataset with the average of each variable
    ## first bind all the objects together into on dataset
    MergedData <- cbind(Data, Labels, Subjects)
    ## Get the average
    Averages <- ddply(MergedData, .(subject, activity), function(x) colMeans(x[, 1:66]))
    ## Write out the new tidy dataset
    write.table(Averages, "tidy data set.txt", row.name=FALSE)
    