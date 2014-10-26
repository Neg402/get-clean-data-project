# Readme.md
## Getting & Cleaning Data Project

1. Read all the data relevant to Testing:
	* Read the X_test.txt file as table and assign to testData
	* Read the subject_test.txt file as table and assign to subjectTest
	* Read the Y_test.txt file as table and assign to activityTest

2. Read all the data relevant to Training:
	* Read the X_train.txt file as table and assign to trainData
	* Read the subject_train.txt file as table and assign to subjectTrain
	* Read the Y_train.txt file as table and assign to activityTrain

3. Read the other useful information i.e. activity labels and variable names:
	* Read the activity_labels.txt file as table and assign to activityLabels
	* Read the features.txt file as table and assign to variableNames

4. Add the relevant Subject and Activity information/column to the Testing data
	* Create a new table called combinedTrain, add dataTrain to it
	* add the columns from subjectTrain and activityTrain combinedTrain

5. Add the relevant Subject and Activity information/column to the Training data
	* Create a new table called combinedTrain, add dataTrain to it
	* add the columns from subjectTrain and activityTrain combinedTrain

6. Combine the Tesing and Training data (they both have the same column names)
	* MERGING: Join combinedTest and combinedTrain
	* reason for using join over merge is to keep the order

7. The combined dataset doesn't have column names, at this stage we add the column names using variableNames and manually adding subject and activity names to the last 2 columns
	* LABEL VARIABLE NAMES: change the name of the columns on dataTestTrain as per the variableNames
	* add "subject" & "activity" to the end

8. Analyse the dataset manually to find the relevant information needed. In this case it is the means and the standard deviation columns. 
	* EXTRACT MEAN & STD: Extract the measurements on the mean & std and assign to extractTestTrain
	* The script extracts only the columns who's name end in mean() or std();
	* followed by -X, -Y or -Z on the features.txt file
	* these columns are: 1:6, 41:46, 81:86, 121:126, 161:166, 266:271, 345:350, 424:429
	* also include the subject and activity columns

9. Change the numbers under the activity column with the correct labels provided in the activityLabels dataset.
	* NAME ACTIVITIES: name the activities as per the activityLabels as below:
	* replace 1 with WALKING,replace 2 with WALKING_UPSTAIRS, replace 3 with WALKING_DOWNSTAIRS
	* replace 4 with SITTING, replace 5 with STANDING, replace 6 with LAYING

10. Create a new data set with the mean of every column calculated for the every combination of subject and activity. Save this as a text file.
	* CREATE independent tidy data set with the average of each variable for each activity and each subject
