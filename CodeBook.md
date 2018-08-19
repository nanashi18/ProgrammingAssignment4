# Code Book for Getting and Cleaning Assignment

This file is the code book for *tidydata.txt*, containing three parts:

* Brief introduction to the raw data from which tidy data is obtained
* Introduction to structures and variables in the tidy data
* Transformation from the raw data to the tidy data


## Raw data

The raw data were obtained from experiments of 30 people (subjects) wearing a smart phone performing six activities. Variables of the raw data include *subject identifiers* ranging from 1 to 30; 561 features with time and frequency domain variables; and corresponding activity labels. 


## Tidy data 

The *tidydata.txt* file is obtained by combining train and test data and filtering out columns such that only data of measurements on the mean and standard deviation for each measurements. 

*tidydata.txt* has 68 columns, separated by a single space. The first row illustrates the name of variables, which are introduced below:

### Subject

The 30 subjects are identitifed by an integer from 1 to 30. 

### Activity

There are 6 activity labels: LAYING, SITTING, STANDING,  WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS

### Average of measurements

According to the requirement, only the measurements on the mean and standard deviation for each measurement are remained in the tidy data set. Here, my implementation choice is to keep measurements having strings "mean()" or "std()". Other measurements containing "mean" such as "fBodyBodyGyroJerkMag-meanFreq()" or "gravityMean" are not considered. 

The acceleration signal from the smartphone accelerometer  (variables with *"Acc"*)  in standard gravity units 'g'. For the angular velocity vector measured by the gyroscope (variables with *"Gyro"*), the units are radians/second. Magnitude of three-dimensional signals (variables with *"Mag"*) were calculated using the Euclidean norm.

All measurement data have been normalized so their value is bounded in the interval [-1,1].

Explanation of variables are listed below. Note that variables starting with *"timeDom"* indicates that they are computed from the time domain while variables starting with *"freqDom"* indicates that they are computed from the frequency domain:

* Average body acceleration  (in X and Y and Z direction):

- timeDomBodyAccMeanX, timeDomBodyAccMeanY, timeDomBodyAccMeanZ

- freqDomBodyAccMeanX,freqDomBodyAccMeanY, freqDomBodyAccMeanZ

* Standard deviation of  body acceleration :

- timeDomBodyAccStdX, timeDomBodyAccStdY, timeDomBodyAccStdZ

- freqDomBodyAccStdX, freqDomBodyAccStdY, freqDomBodyAccStdZ 

* Average gravitty acceleration :

  - timeDomGravityAccMeanX, timeDomGravityAccMeanY, timeDomGravityAccMeanZ 


* Standard deviation of gravity acceleration :

- timeDomGravityAccStdX, timeDomGravityAccStdY, timeDomGravityAccStdZ 

* Average body acceleration jerk:

- timeDomBodyAccJerkMeanX, timeDomBodyAccJerkMeanY, timeDomBodyAccJerkMeanZ

- freqDomBodyAccJerkMeanX, freqDomBodyAccJerkMeanY, freqDomBodyAccJerkMeanZ 

* Standard deviation of body acceleration jerk:

- timeDomBodyAccJerkStdX, timeDomBodyAccJerkStdY, timeDomBodyAccJerkStdZ 

- freqDomBodyAccJerkStdX, freqDomBodyAccJerkStdY, freqDomBodyAccJerkStdZ 


* Average body angular velocity:

- timeDomBodyGyroMeanX, timeDomBodyGyroMeanY, timeDomBodyGyroMeanZ 

- freqDomBodyGyroMeanX, freqDomBodyGyroMeanY, freqDomBodyGyroMeanZ 

* Standard deviation of body angular velocity:

- timeDomBodyGyroStdX, timeDomBodyGyroStdY, timeDomBodyGyroStdZ

- freqDomBodyGyroStdX, freqDomBodyGyroStdY, freqDomBodyGyroStdZ 

* Average body angular velocity jerk:

- timeDomBodyGyroJerkMeanX, timeDomBodyGyroJerkMeanY, timeDomBodyGyroJerkMeanZ 

* Standard deviation of body angular velocity jerk:

- timeDomBodyGyroJerkStdX, timeDomBodyGyroJerkStdY, timeDomBodyGyroJerkStdZ 

* Average magnitude of body acceleration:

- timeDomBodyAccMagMean

- freqDomBodyAccMagMean 

* Standard deviation of  magnitude of body acceleration:

- timeDomBodyAccMagStd

- freqDomBodyAccMagStd 

* Average magnitude of gravity acceleration:

- timeDomGravityAccMagMean 

* Standard deviation of magnitude of gravity acceleration:

- timeDomGravityAccMagStd

* Average magnitude of body acceleration jerk:

- timeDomBodyAccJerkMagMean

- freqDomBodyBodyAccJerkMagMean 

* Standard deviation of magnitude of body acceleration jerk:
 
- timeDomBodyAccJerkMagStd 

- freqDomBodyBodyAccJerkMagStd 


* Average magnitude of body angular velocity:

- timeDomBodyGyroMagMean 

- freqDomBodyBodyGyroMagMean

* Standard deviation of body angular velocity:

- timeDomBodyGyroMagStd 

- freqDomBodyBodyGyroMagStd 

* Average magnitude of body angular velocity jerk:

- timeDomBodyGyroJerkMagMean 

- freqDomBodyBodyGyroJerkMagMean

* Standard deviation of body angular velocity jerk:

- timeDomBodyGyroJerkMagStd 

- freqDomBodyBodyGyroJerkMagStd




## Transformation from the raw data to the tidy data

* In the raw data, activities are represented as integer values:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
In the tidy data, integers have been transformed into more descriptive activity labels

*  Subjects, activites and measurements are combined into the same data frame
*  Training and test data are merged into one data set
*  The measurements containing the strings "mean()" and "std()" were extracted
*  Rename variable names: 
         * remove '-' and '()'
         * variables with 'f' as the initial character are changed to "freqDom"
         * variables with 't' as the initial character are changed to "timeDom"
         * Captialize 'm' and 's' in "mean" and "std"
*  Create the tidy dataset by computing the average of each variable for each activity and each subject
   



