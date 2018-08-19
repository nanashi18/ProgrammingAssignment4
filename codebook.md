# Cook Book for Getting and Cleaning Assignment


This goal of this project is to read and clean a data set for later analysis. The data was collected from 30 volunteers who performed   
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. 
Using the accelerometer and gyroscope on the phone, data of 3-axial linear acceleration and 3-axial angular velocity were captured. The whole data set is divided into two parts: 70% are the training data and 30% are the test data.  

The objective of the project is to write a script doing the following things:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Introduction to the analysis script

The script is in the file run_analysis.R. Before running the script, you should download the data as a zip file and unzip it in the working directory of R. The script does the following things step by step:

* Read features and activity labels into the environment
* Read subjects, X and Y respectively from the test folder as *testsubjects*, *testX* and *testY*
* Rename column names in *testX* and *testY* according to the feature and activity names
* Read subjects, X and Y respectively from the train folder as *trainsubjects*, *trainX* and *trainY*
* Rename column names in *trainX* and *trainY* according to the feature and activity names
* Bind rows of *trainX* and *testX* as *bindTestTrainX* and extracts the columns of measurements on the mean and standard deviation for each measurement
* Bind rows of *testY* and *trainY* as *bindTestTrainY*
* Bind rows of *testsubjects* and *trainsubjects* as *bindTestTrainSubjects*
* Bind columns of *bindTestTrainSubjects*,*bindTestTrainY* and *bindTestTrainX* following the order: subject, activity name and features; the name of the binded data is *bindAllTest*
* Create a second, independent tidy data set from *bindAllTest* with the average of each variable for each activity and each subject
* Write the tidy data set as the file *tidydata.txt*

The script is implemented and tested using R version 3.5.0 (2018-04-23) on MacOS 10.13.4


