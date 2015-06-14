# You should create one R script called run_analysis.R that does the following. 
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

### Merging the training and the test set in one data set.

if(!file.exists("UCI HAR Dataset")){
        message("Couldn't find the 'UCI HAR Dataset' directory")
}

# Reading files
trainingDF <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingActDF <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")

testDF <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActDF <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")

featuresDF <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activityNamesDF <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Combining data sets
allDF <- rbind(trainingDF, testDF)
allActDf <- rbind(trainingActDF, testActDF)

# Removing unnecessary intermediate data sets
rm(trainingDF, testDF, trainingActDF, testActDF)

# Setting columns names
names(allDF) <- featuresDF[[2]]

### Extracting only the measurements on the mean and standard deviation for each measurement.

# What columns have means and standard deviations?
colsMeansStd <- grep('mean|std', names(allDF))

# Keeping just these columns
allDF <- allDF[colsMeansStd]

### Using descriptive activity names to name the activities in the data set

activityFactor <- activityNamesDF[allActDf$activity, 2]
allDF <- cbind(activity=activityFactor, allDF)

### Appropriately labeling the data set with descriptive variable names

# Already done.

### From the data set in step 4, creates a second, independent tidy data set with the average
### of each variable for each activity and each subject.

# Adding subjects to the DF
trainingSubDF <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubDF <- read.table("UCI HAR Dataset/test/subject_test.txt")
allSubDF <- rbind(trainingSubDF, testSubDF)
allDF <- cbind(subject=allSubDF$V1, allDF)

# In dplyr it would look like
#
# tidyDataSet = allDF %>%
#               group_by(subject, activity) %>%
#               summarise_each(funs(mean))

tidyDataSet <- aggregate(by = list(Subject=allDF$subject, Activity=allDF$activity),
                         x = allDF[, -c(1:2)],
                         FUN = mean)