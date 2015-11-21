## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Hudson Ludvigson copyright. November, 2015.
## This is the code file for the Getting and Cleaning data course project
## coding project.  From the website the steps they outline
##
##  You should create one R script called run_analysis.R that does the following. 
##  1. Merges the training and the test sets to create one data set.
##  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3. Uses descriptive activity names to name the activities in the data set
##  4. Appropriately labels the data set with descriptive variable names. 
##  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
##  Good luck!

## Note I unzipped the .zip file manually, so there is no
# Get the test set data first
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Get the train data now
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

## R code for that, but if that was a thing we had to learn/do...well I guess
## dock me some points, cause I didn't do it.  

## So, I opened the ReadMe.txt in that UCI HAR folder that was part of unzip to see the
## test and train folders. Let's use those for the merge in step 1.



## From these data sets that we are going to merge all we care about is
## mean and standard deviation.

features <- read.table("./UCI HAR Dataset/features.txt")[,2]
meanStdFeatures <- grepl("mean|std", features)

## From our lessons recall names is used to get/set the names of an object
names(Xtest) = features
Xtest = Xtest[,meanStdFeatures]

## Now get those activity labels for test data.

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
Ytest[,2] = activityLabels[Ytest[,1]]
names(Ytest) = c("Activity_ID", "Activity_Label")

## Now the subject test
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subjectTest) = "subject"

## Get the data binded
testD <- cbind(as.data.frame.table(subjectTest), Ytest, Xtest)


## Ok, so test data should be done, we have the train data, no let's use it the same
## way and then we'll merge the two.  This should be roughly a cut and paste of above
## but we'll be worried ab out the train folder instead of test folder....let's see how this goes.

## From our lessons recall names is used to get/set the names of an object
names(Xtrain) = features
Xtrain = Xtrain[,meanStdFeatures]

## Now get those activity labels for TRAIN data.
Ytrain[,2] = activityLabels[Ytrain[,1]]

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subjectTrain) = "subject"

names(Ytrain) = c("Activity_ID", "Activity_Label")

## Get the data binded
trainD <- cbind(as.data.frame.table(subjectTrain), Ytrain, Xtrain)


## Alright, so now we have (in theory) trainD and testD, merge the suckers

# train and test data put together using rbind
total = rbind(testD, trainD)
iDs   = c("subject", "Activity_ID", "Activity_Label")
dLabels = setdiff(colnames(total), iDs)
melted      = melt(total, id = iDs, measure.vars = dLabels)


## What didn't work
#finalData   = dcast(melted, subject + Activity_Label ~ variable.names() , mean)
#write.table(finalData, file = "./finalData.txt")

## and here is where I've failed...I cannot figure out how to create the final
## bloody table....I've tried like 5 things and I keep getting various errors....submitting
## for now in the hopes of partial credit.



