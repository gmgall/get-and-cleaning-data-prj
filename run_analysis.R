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
testDF <- read.table("./UCI HAR Dataset/test/X_test.txt")
featuresDF <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Combining data sets
allDF <- rbind(trainingDF, testDF)

# Removing unnecessary intermediate data sets
rm(trainingDF, testDF)

# Setting columns names
names(allDF) <- featuresDF[[2]]

### Extracting only the measurements on the mean and standard deviation for each measurement.

# What columns have means and standard deviations?
colsMeansStd <- grep('mean|std', names(allDF))

# Keeping just these columns
allDF <- allDF[colsMeansStd]

### Using descriptive activity names to name the activities in the data set