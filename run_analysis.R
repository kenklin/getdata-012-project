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
  test            <- read.table("X_test.txt")
  ytest           <- read.table("y_test.txt")

  # 1. Merge the training and the test sets to create one data set.
  data <- rbind(train, test)
  
  # 2. Extract only the measurements on the mean and standard deviation for each
  #    measurement.  Per features_info.txt ...
  #
  #        The set of variables that were estimated from these signals are:
  #             mean(): Mean value
  #             std(): Standard deviation
  colindices <- features[grep("mean\\(\\)|std\\(\\)", features$V2), 1]
  extracteddata <- data[, colindices]

  # 3. Use descriptive activity names to name the activities in the data set
  activity_ids <- rbind(ytrain, ytest)
data1 <- data
  data1$activity_ids <- activity_ids[1,]
  feature_labels <- c(feature_labels, "activity_ids")

  # 4. Appropriately labels the data set with descriptive variable names.
#  rawnames <- features[colindices, 2]
  names(data1) <- feature_labels

  # 5. From the data set in step 4, creates a second, independent tidy data set
  #    with the average of each variable for each activity and each subject.
  
}
