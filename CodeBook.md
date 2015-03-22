run_analysis Code Book
======================

Note: Sections of this code book are taken from *Human Activity Recognition Using Smartphones Dataset* and its associated files.  For an overview of that project, please refer to its files, in particular:
- *README.md*
- *features_info.txt*

*tidydata.txt* Observations
---------------------------

In the *run_analysis()* function's *tidydata.txt* output, each observation consists is on its own row and has these
two unqiue values:
- activity_names: Directly obtained from *activity_labels.txt*

  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING_DOWNSTAIRS
  - WALKING_UPSTAIRS

*tidydata.txt* Variables
------------------------

- tBodyAcc_XYZ
- tGravityAcc_XYZ
- tBodyAccJerk_XYZ
- tBodyGyro_XYZ
- tBodyGyroJerk_XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc_XYZ
- fBodyAccJerk_XYZ
- fBodyGyro_XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean: Mean value
- std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in *tidynames.txt*
