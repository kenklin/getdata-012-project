run_analysis Code Book
======================

Note: Sections of this code book are taken from *Human Activity Recognition Using Smartphones Dataset* and its associated files.  For an overview of that project, please refer to its files, in particular:
- *README.md*
- *features_info.txt*

*tidydata.txt* Observation Variables
------------------------------------

In the *run_analysis()* function's *tidydata.txt* output, each observation consists is on its own row and has these
two unqiue values:

- activity_names: [Character] Directly obtained from *activity_labels.txt*

  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING_DOWNSTAIRS
  - WALKING_UPSTAIRS

- subject_ids: [Integer] Anonymized subject ids, 1 - 30.
 

*tidydata.txt* Description Variables
------------------------------------

While the original data set has 561 columns, whose labels are in *features.txt*, the *run_analysis()* function calculates the **mean** of those (original) columns that measure a *mean()* or *std()*.

- tBodyAcc_XYZ: [Number] **mean** of all tBodyAcc-XYZ for each activity_names/subject_ids observations
- tGravityAcc_XYZ: [Number] **mean** of all tGravityAcc-XYZ for each activity_names/subject_ids observations
- tBodyAccJerk_XYZ: [Number] **mean** of all tBodyAccJerk-XYZ for each activity_names/subject_ids observations
- tBodyGyro_XYZ: [Number] **mean** of all tBodyGyro-XYZ for each activity_names/subject_ids observations
- tBodyGyroJerk_XYZ: [Number] **mean** of all tBodyGyroJerk-XYZ for each activity_names/subject_ids observations
- tBodyAccMag: [Number] **mean** of all tBodyAccMag-XYZ for each activity_names/subject_ids observations
- tGravityAccMag: [Number] **mean** of all tGravityAccMag-XYZ for each activity_names/subject_ids observations
- tBodyAccJerkMag: [Number] **mean** of all tBodyAccJerkMag-XYZ for each activity_names/subject_ids observations
- tBodyGyroMag: [Number] **mean** of all tBodyGyroMag-XYZ for each activity_names/subject_ids observations
- tBodyGyroJerkMag: [Number] **mean** of all tBodyGyroJerkMag-XYZ for each activity_names/subject_ids observations
- fBodyAcc_XYZ: [Number] **mean** of all fBodyAcc-XYZ for each activity_names/subject_ids observations
- fBodyAccJerk_XYZ: [Number] **mean** of all tBodyAccJerk-XYZ for each activity_names/subject_ids observations
- fBodyGyro_XYZ: [Number] **mean** of all fBodyGyro-XYZ for each activity_names/subject_ids observations
- fBodyAccMag: [Number] **mean** of all fBodyAccMag-XYZ for each activity_names/subject_ids observations
- fBodyAccJerkMag: [Number] **mean** of all fBodyAccJerkMag-XYZ for each activity_names/subject_ids observations
- fBodyGyroMag: [Number] **mean** of all fBodyGyroMag-XYZ for each activity_names/subject_ids observations
- fBodyGyroJerkMag: [Number] **mean** of all fBodyGyroJerkMag-XYZ for each activity_names/subject_ids observations

The set of variables that were estimated from these signals are: 

- mean: Mean value
- std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean: [Number] **mean** of all gravityMean for each activity_names/subject_ids observations
- tBodyAccMean: [Number] **mean** of all tBodyAccMean for each activity_names/subject_ids observations
- tBodyAccJerkMean: [Number] **mean** of all tBodyAccJerkMean for each activity_names/subject_ids observations
- tBodyGyroMean: [Number] **mean** of all tBodyGyroMean for each activity_names/subject_ids observations
- tBodyGyroJerkMean: [Number] **mean** of all tBodyGyroJerkMean for each activity_names/subject_ids observations

The complete list of variables of each feature vector is available in *tidynames.txt*
