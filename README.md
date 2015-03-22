One of the most exciting areas in all of data science right now is wearable computing - see for example this article.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S
smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R's *run_analysis()* function prepares tidy data that can be used for later analysis.
The function takes no arguments but requires the files it needs can be read from the working directory:

- activity_labels.txt
- features.txt
- subject_test.txt
- subject_train.txt
- X_test.txt
- X_train.txt
- y_test.txt
- y_train.txt

Likewise, its *tidydata.txt* file will be written to the working directory.

The *run_analysis()* function does the following (though not necessariy in order internally):

1. Merges the training and the test sets from the working directory to create
   one data set.
2. Extracts only the measurements on the mean and standard deviation for each
   measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set in
   "tidydata.txt" in the working directory with the average of each variable
   for each activity and each subject.
