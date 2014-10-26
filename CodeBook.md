CodeBook
1. The txt files were all read and assigned to the below variable:
dataTest <-X_test.txt
subjectTest <- subject_test.txt
activityTest <- Y_test.txt
dataTrain <- X_train.txt
subjectTrain <- subject_train.txt")
activityTrain <- Y_train.txt
activityLabels <- activity_labels.txt
variableNames <- features.txt
2. the train data was combined with its subject and activities and assigned to combinedTrain
3. the test data was combined with its subject and activities and assigned to combinedTest
4. combinedTrain and combinedTest were merged to make dataTestTrain
5. column names were added to the dataTestTrain (using activityLabels)
6. All the columns to do with mean and standard deviation were identified and extracted from the data set and saved in a new variable called extractTestTrain (these were the columns who's name end in mean() or std() followed by -X, -Y or -Z,columns 1:6, 41:46, 81:86, 121:126, 161:166, 266:271, 345:350, 424:429 plus subject and activity cols)
7. Number under the activity column were replaces with descriptive labels as: replace 1 with WALKING,replace 2 with WALKING_UPSTAIRS, replace 3 with WALKING_DOWNSTAIRS, replace 4 with SITTING, replace 5 with STANDING, replace 6 with LAYING
8. This tidied up data was saved in a new variable called tidyData
9. created tidyOutput variable which is an independent tidy data set with the average of each variable for each activity and each subject
10. finally tidyOutput was saved down as a text file.
