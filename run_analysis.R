#download and unzip data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("HARDataset.zip")) {
  download.file(url, dest="HARDataset.zip", mode = "wb")
}
if (!file.exists("HARDataset")) {
  unzip("HARDataset.zip")
}

#read features
features <- read.table("./UCI HAR Dataset/features.txt", sep= " ",
                      col.names=c("featureid","featurename"))
#read activity labels
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = " ",
                             col.names = c("activityid","activityname"))

#get activity name
getActivityName <- function(x) {
  as.character(activitylabels[x,2])
}

#read subjects in test data
testsubjects <- unlist(read.table("./UCI HAR Dataset/test/subject_test.txt"),use.names=FALSE)
#read Xs in test data
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
#set column names of testX to feature names
colnames(testX) <- as.character(features[[2]])
#read Ys in test data
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")
#map from activity id to name
testYNamed <- unlist(lapply(testY, getActivityName), use.names=FALSE)


#read subjects in train data
trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#read X in train data
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
#set column names of testX to feature names
colnames(trainX) <- as.character(features[[2]])
#read Y in train data
trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt")
#map from activity id to name
trainYNamed <- unlist(lapply(trainY, getActivityName), use.names=FALSE)

#Merges the training and the test sets to create one data set

#bind rows of train X and test X
bindTestTrainX <- rbind(trainX,testX)
#filter columns
#only columns with "mean()" or "std()" are remained
bindTestTrainX <- bindTestTrainX[grepl("mean\\(\\)|std\\(\\)", names(bindTestTrainX))]

#bind rows of train Y and test Y
bindTestTrainY <- append(trainYNamed,testYNamed)
bindTestTrainSubjects <- append(unlist(trainsubjects, use.names=FALSE)
                                ,unlist(testsubjects, use.names=FALSE))

#bindAllTest is the data set for step 4 
bindAllTest <- cbind(bindTestTrainSubjects,bindTestTrainY,bindTestTrainX)
colnames(bindAllTest)[1] <- "subject"
colnames(bindAllTest)[2] <- "activity"

#clean up names
#remove "()" and "-"
colnames(bindAllTest) <- gsub("-", "", colnames(bindAllTest))
colnames(bindAllTest) <- gsub("\\(\\)", "", colnames(bindAllTest))
#change f and t to more descriptive names 
colnames(bindAllTest) <- gsub("^f", "freqDom", colnames(bindAllTest))
colnames(bindAllTest) <- gsub("^t", "timeDom", colnames(bindAllTest))
#captitalize "mean" and "std"
colnames(bindAllTest) <- gsub("mean", "Mean", colnames(bindAllTest))
colnames(bindAllTest) <- gsub("std", "Std", colnames(bindAllTest))


#tidy data for step 5
tidydata <- aggregate(bindAllTest[,seq(3,length(names(bindAllTest)))], list(bindAllTest[[1]],bindAllTest[[2]]),mean)
#rename of the first and second columns to subject and activity 
colnames(tidydata)[1] <- "subject"
colnames(tidydata)[2] <- "activity"
tidydata <- tidydata[order(tidydata$subject),]

write.table(tidydata, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE, quote = FALSE)


