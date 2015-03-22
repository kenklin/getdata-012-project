run_analysis <- function() {
  require(dplyr)

  # Read the raw data files
  dfFeatureLabels  <- read.table("features.txt")
  vFeatureLabels   <- as.character(dfFeatureLabels$V2)
  
  dfActivityLabels <- read.table("activity_labels.txt")
  names(dfActivityLabels) <- c("activity_ids", "activity_names")
  
  train           <- read.table("X_train.txt")
  ytrain          <- read.table("y_train.txt")
  subject_train   <- read.table("subject_train.txt")

  test            <- read.table("X_test.txt")
  ytest           <- read.table("y_test.txt")
  subject_test    <- read.table("subject_test.txt")

  # 1. Merge the training and the test sets to create one data set.
  data <- rbind(train, test)

  # 1a. Append activity_ids column (numeric ids might be use)
  newcol <- rbind(ytrain, ytest)
  vFeatureLabels <- c(vFeatureLabels, "activity_ids")
  data$activity_ids <- newcol[,1]
  
  # 1b. Append subject_ids column
  newcol <- rbind(subject_train, subject_test)
  vFeatureLabels <- c(vFeatureLabels, "subject_ids")
  data$subject_ids <- newcol[,1]
  
  # 2. Extract only the measurements on the mean and standard deviation for each
  #    measurement.  Per features_info.txt ...
  #
  #        The set of variables that were estimated from these signals are:
  #             mean(): Mean value
  #             std(): Standard deviation
  colindices <- features[grep("mean\\(\\)|std\\(\\)", features$V2), 1]
  extracteddata <- data[, colindices]

  # 3. Use descriptive activity names to name the activities in the data set
  data <- merge(data, dfActivityLabels, by="activity_ids")
  
  # 4. Appropriately labels the data set with descriptive variable names.
  vFeatureLabels <- gsub("-",   "_", vFeatureLabels)
  vFeatureLabels <- gsub(",",   "_", vFeatureLabels)
  vFeatureLabels <- gsub("\\(", "",  vFeatureLabels)
  vFeatureLabels <- gsub("\\)", "",  vFeatureLabels)
  vFeatureLabels <- gsub("__",  "_", vFeatureLabels)
  
  names(data) <- vFeatureLabels

  # 5. From the data set in step 4, creates a second, independent tidy data set
  #    with the average of each variable for each activity and each subject.
  
  data
}
