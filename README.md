# Getting and Cleaning Data course project
As required for this assignment this is the README file to explain the project.

A lot of what is in here is a cut and paste from the comments that I put in the code.

Nobody wants to read a book so I'll try to keep this brief.  

## Note I unzipped the .zip file manually, so there is no
# Get the test set data first
# Get the train data next

## From these data sets that we are going to merge all we care about is
## mean and standard deviation.  So grepl those out.

## Now get those activity labels for test data.

## Those steps were done for the test data, repeat for the train data

## Then use rbind and melt to get the data together.

## Finally I wanted to use dcast and then write a table but I could not get my
## Dcast to work.

