# Read the X_test.txt file as table and assign to testData
dataTest <-read.table("./UCI HAR Dataset/test/X_test.txt")
# Read the subject_test.txt file as table and assign to subjectTest
subjectTest <-read.table("./UCI HAR Dataset/test/subject_test.txt")
# Read the Y_test.txt file as table and assign to activityTest
activityTest <-read.table("./UCI HAR Dataset/test/Y_test.txt")

# Read the X_train.txt file as table and assign to trainData
dataTrain <-read.table("./UCI HAR Dataset/train/X_train.txt")
# Read the subject_train.txt file as table and assign to subjectTrain
subjectTrain <-read.table("./UCI HAR Dataset/train/subject_train.txt")
# Read the Y_train.txt file as table and assign to activityTrain
activityTrain <-read.table("./UCI HAR Dataset/train/Y_train.txt")

# Read the activity_labels.txt file as table and assign to activityLabels
activityLabels <-read.table("./UCI HAR Dataset/activity_labels.txt")
# Read the features.txt file as table and assign to variableNames
variableNames <-read.table("./UCI HAR Dataset/features.txt")

# Create a new table called combinedTrain, add dataTrain to it
# add the columns from subjectTrain and activityTrain combinedTrain
combinedTest <- dataTest
combinedTest$subject <- subjectTest[,1]
combinedTest$activity <-activityTest[,1]

# Create a new table called combinedTrain, add dataTrain to it
# add the columns from subjectTrain and activityTrain combinedTrain
combinedTrain <- dataTrain
combinedTrain$subject <- subjectTrain[,1]
combinedTrain$activity <-activityTrain[,1]

# MERGING: Join combinedTest and combinedTrain
# reason for using join over merge is to keep the order
library(plyr)
dataTestTrain <- join(combinedTest, combinedTrain)


# LABEL VARIABLE NAMES: change the name of the columns on dataTestTrain as per the variableNames
# add "subject" & "activity" to the end

colAdd <- data.frame(V1 = c(0, 0), V2 = c("subject", "activity"))
columnNames <- rbind(variableNames, colAdd)
colnames(dataTestTrain) <- columnNames[,2]

# EXTRACT MEAN & STD: Extract the measurements on the mean & std and assign to extractTestTrain
# The script extracts only the columns who's name end in mean() or std();
# followed by -X, -Y or -Z on the features.txt file
# these columns are: 1:6, 41:46, 81:86, 121:126, 161:166, 266:271, 345:350, 424:429
# also include the subject and activity columns
extractTestTrain <- data.frame(matrix(ncol=0, nrow=2947))
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,1:6])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,41:46])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,121:126])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,161:166])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,266:271])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,345:350])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,424:429])
extractTestTrain <- cbind(extractTestTrain,dataTestTrain[,562:563])

# NAME ACTIVITIES: name the activities as per the activityLabels as below:
# replace 1 with WALKING,replace 2 with WALKING_UPSTAIRS, replace 3 with WALKING_DOWNSTAIRS
# replace 4 with SITTING, replace 5 with STANDING, replace 6 with LAYING
extractTestTrain$activity<-replace(extractTestTrain$activity, extractTestTrain$activity==1,"WALKING")
extractTestTrain$activity<-replace(extractTestTrain$activity, extractTestTrain$activity==2,"WALKING_UPSTAIRS")
extractTestTrain$activity<-replace(extractTestTrain$activity, extractTestTrain$activity==3,"WALKING_DOWNSTAIRS")
extractTestTrain$activity<-replace(extractTestTrain$activity, extractTestTrain$activity==4,"SITTING")
extractTestTrain$activity<-replace(extractTestTrain$activity, extractTestTrain$activity==5,"STANDING")
extractTestTrain$activity<-replace(extractTestTrain$activity, extractTestTrain$activity==6,"LAYING")
tidyData <- extractTestTrain

# CREATE independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
library(reshape2)

tidyOutput <- tidyData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

write.table(tidyOutput, file = "tidyOutput.txt", row.name=FALSE)
