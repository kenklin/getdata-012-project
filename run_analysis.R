#
# class.coursera.org/getdata-012 - Course Project
#
# Function that performs the following (though not necessariy in order internally):
# 1. Merges the training and the test sets from the working directory to create
#    one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set in
#    "tidydata.txt" in the working directory with the average of each variable
#    for each activity and each subject.
#
# See README.md abd CodeBook.md for further details
#
run_analysis <- function() {
  require(dplyr)

  # Read the feature labels into vector vFeatureLabels
  dfFeatureLabels  <- read.table("features.txt")
  vFeatureLabels   <- as.character(dfFeatureLabels$V2)
  
  # Read the activity labels into dataframe with column names "activity_ids" and
  # "activity_names" (cols 1 and 2)
  dfActivityLabels <- read.table("activity_labels.txt")
  names(dfActivityLabels) <- c("activity_ids", "activity_names")

  # Read the training data, activity ids, and subject ids
  train           <- read.table("X_train.txt")
  activity_train  <- read.table("y_train.txt")
  subject_train   <- read.table("subject_train.txt")

  # Read the test data, activity ids, and subject ids
  test            <- read.table("X_test.txt")
  activity_test   <- read.table("y_test.txt")
  subject_test    <- read.table("subject_test.txt")

  # 1. Merge the training and the test sets to create one data set.
  df <- rbind(train, test)

  # 2. Appropriately label the data set with descriptive variable names.
  vFeatureLabels <- gsub("-",   "_", vFeatureLabels) # dash to underscore
  vFeatureLabels <- gsub(",",   "_", vFeatureLabels) # comma to underscore
  vFeatureLabels <- gsub("\\(", "",  vFeatureLabels) # lparen removed
  vFeatureLabels <- gsub("\\)", "",  vFeatureLabels) # rparen removed
  vFeatureLabels <- gsub("__",  "_", vFeatureLabels) # multi-underscores to single underscore
  names(df) <- vFeatureLabels

  # 3. Extract only the measurements on the mean and standard deviation for each
  #    measurement.  Per features_info.txt ...
  #
  #        The set of variables that were estimated from these signals are:
  #             mean(): Mean value
  #             std(): Standard deviation
  colindices <- features[grep("mean\\(\\)|std\\(\\)", features$V2), 1]
  df <- df[, colindices]
  
  # 3a. Append activity_ids column (these numeric ids might remain useful so
  #     so keep it.  It is needed for the merge in step 4)
  newcol <- rbind(activity_train, activity_test)
  df$activity_ids <- newcol[ ,1]
  
  # 3b. Append subject_ids column
  newcol <- rbind(subject_train, subject_test)
  df$subject_ids <- newcol[ ,1]

  # 4. Use descriptive activity names to name the activities in the data set
  df <- merge(df, dfActivityLabels, by="activity_ids") # activity_names from dfActivityLabels

  # 5. From the data set in step 4, creates a second, independent tidy data set
  #    with the average of each variable for each activity and each subject.
  gdf <- group_by(df, activity_names, subject_ids)
  tidy <- summarise_each(gdf, funs(mean), -(activity_ids))
  
  # Write data to tidydata.txt in working directory
  write.table(tidy, file = "tidydata.txt", row.name = FALSE)

  tidy
}
