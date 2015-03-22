lookup <- function(dfKeyValue, keys) {
  dfKeyValue[dfKeyValue$V1==keys, 2]
}

run_analysis <- function() {
  require(dplyr)

  # Read the raw data files
  feature_labels  <- read.table("features.txt")
  feature_labels  <- as.character(feature_labels$V2)
  
  activity_labels <- read.table("activity_labels.txt")
  activity_labels <- as.character(activity_labels$V2)
  
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
  feature_labels <- c(feature_labels, "activity_ids")
  data$activity_ids <- newcol[,1]
  
  # 1b. Append subject_ids column
  newcol <- rbind(subject_train, subject_test)
  feature_labels <- c(feature_labels, "subject_ids")
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
  
  # 4. Appropriately labels the data set with descriptive variable names.
  feature_labels <- gsub("-",   "_", feature_labels)
  feature_labels <- gsub(",",   "_", feature_labels)
  feature_labels <- gsub("\\(", "",  feature_labels)
  feature_labels <- gsub("\\)", "",  feature_labels)
  feature_labels <- gsub("__",  "_", feature_labels)
  
  names(data) <- feature_labels

  # 5. From the data set in step 4, creates a second, independent tidy data set
  #    with the average of each variable for each activity and each subject.
  
  data
}
