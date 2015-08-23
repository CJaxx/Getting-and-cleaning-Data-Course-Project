Code Book for Getting and Cleaning Data - Course Project

1. The raw data
The raw data is provided in multiple files, and divided into 2 data sets, a training data set which includes 70% of the subjects involved and a test data set, which includes 30% of the subjects.

The first step is to download the data and unzip it

The README provided with the data shows that each of these data sets has 3 files each that we need to work with to produce the final data set:

The training data set is broken up into data (the X_train.txt file), data labels (the y_train.txt file) and the subjects who took part (identified by a number in the subject_train.txt file.

The test data set is divided up in the same way and the text files have the same dimensions

The second step is to read the relevant tables into R tables.

Training data set:
SubjTrain = data from the subject_train.txt file
TrainData = data from the X_train.txt file
TrainLabels = data from the y_train.txt file

Test data set: 
SubjTest = data from the subject_train.txt file
TestData = data from the X_train.txt file
TestLabels = data from the y_train.txt file

The data is in multiple dataframes, so rbind is used to combine the six separate dataframes for the training and test sets into three.  So the script binds the training data to the test data, the training labels to the test labels, and the training subjects to the test subjects (on a like-for-like basis), resulting in three data frames: Data, Labels, and Subjects.

For the purposes of this project, we are only interested in the mean and the standard deviation of each measurement recorded in the data sets, so the fourth step in the script extracts this using the list of all features (importing the features.txt file and using grep() to create a vector (mean_std) which is used to subset the combined Data dataframe.

The next step (Step 5) is to include sensible labels for the data.  The script does this by importing the list of all activities recorded in the activity_labels dataset.  This is then used to update the Labels and Subject variables with the appropriate labels.


Step 6 creates a merged dataset using cbind to glue the three variables into one, then the average is calculated.


Summary

Raw datafiles used:

subject_train.txt
X_train.txt
y_train.txt
subject_test.txt
X_test.txt
y_test.txt
features.txt
activity_labels

R dataframes:
SubjTrain
TrainData
TrainLables
SubjTest
TestData
TestLabels
Data (TrainData & TestData
Labels (TrainLabels & Test Labels
Subjects (SubjTrain & SubjTest)
features
activity labels
MergedData - combined dataset uesd to calculate the averages before creating the "tidy data set.txt" file

Tidy dataset columns output:

subject - (the number identifying the person taking part in the study)
activity - (the activity they were undertaking when the measurements were recorded (including:  WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; and 6 LAYING))
List of measurements recorded by the wearable technology:
	tBodyAcc-mean()-X
	tBodyAcc-mean()-Y
	tBodyAcc-mean()-Z
	tBodyAcc-std()-X
	tBodyAcc-std()-Y
	tBodyAcc-std()-Z
	tGravityAcc-mean()-X
	tGravityAcc-mean()-Y
	tGravityAcc-mean()-Z
	tGravityAcc-std()-X
	tGravityAcc-std()-Y
	tGravityAcc-std()-Z
	tBodyAccJerk-mean()-X
	tBodyAccJerk-mean()-Y
	tBodyAccJerk-mean()-Z
	tBodyAccJerk-std()-X
	tBodyAccJerk-std()-Y
	tBodyAccJerk-std()-Z
	tBodyGyro-mean()-X
	tBodyGyro-mean()-Y
	tBodyGyro-mean()-Z
	tBodyGyro-std()-X
	tBodyGyro-std()-Y
	tBodyGyro-std()-Z
	tBodyGyroJerk-mean()-X
	tBodyGyroJerk-mean()-Y
	tBodyGyroJerk-mean()-Z
	tBodyGyroJerk-std()-X
	tBodyGyroJerk-std()-Y
	tBodyGyroJerk-std()-Z
	tBodyAccMag-mean()
	tBodyAccMag-std()
	tGravityAccMag-mean()
	tGravityAccMag-std()
	tBodyAccJerkMag-mean()
	tBodyAccJerkMag-std()
	tBodyGyroMag-mean()
	tBodyGyroMag-std()
	tBodyGyroJerkMag-mean()
	tBodyGyroJerkMag-std()
	fBodyAcc-mean()-X
	fBodyAcc-mean()-Y
	fBodyAcc-mean()-Z
	fBodyAcc-std()-X
	fBodyAcc-std()-Y
	fBodyAcc-std()-Z
	fBodyAcc-meanFreq()-X
	fBodyAcc-meanFreq()-Y
	fBodyAcc-meanFreq()-Z
	fBodyAccJerk-mean()-X
	fBodyAccJerk-mean()-Y
	fBodyAccJerk-mean()-Z
	fBodyAccJerk-std()-X
	fBodyAccJerk-std()-Y
	fBodyAccJerk-std()-Z
	fBodyAccJerk-meanFreq()-X
	fBodyAccJerk-meanFreq()-Y
	fBodyAccJerk-meanFreq()-Z
	fBodyGyro-mean()-X
	fBodyGyro-mean()-Y
	fBodyGyro-mean()-Z
	fBodyGyro-std()-X
	fBodyGyro-std()-Y
	fBodyGyro-std()-Z
	fBodyGyro-meanFreq()-X
	fBodyGyro-meanFreq()-Y
