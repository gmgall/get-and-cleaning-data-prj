# The project describes 5 steps to transform the raw data colected from the
# "Human Activity Recognition Using Smartphones Data Set" in tidy data ready
# for analisys. The data was obtained from
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# The steps are:
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for 
#    each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names.
# 5. From the data set in step 4, create a second, independent tidy data
#    set with the average of each variable for each activity and each
#    subject.
#
# Each one of these steps are highlighted below with a commented line
# beginning with ###. Other comments were made throughout the code but ###
# was reserved to mark the separation between the logical steps described
# above.

# Before getting in the steps in itself is necessary to read the files of
# interest from the study data set. The script will try to find them in the
# working directory. If it doesn't find them, will ask permission to download
# the data set.
if(!file.exists("UCI HAR Dataset")){
        message("Couldn't find the 'UCI HAR Dataset' directory")
        userInput <- readline(prompt = "Download it? [y/n] ")
        if(gsub("(^[[:space:]]+|[[:space:]]+$)", "", userInput) == 'y'){
                download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                              method = "curl", destfile = "dataset.zip")
                unzip("dataset.zip")
        }
        else
                stop("No data set to work")
}

# The data frames with the content of the files are:
#
# - trainingDF: the training set
# - trainingActDF: to which activity the corresponding line in the training
#   set refers
# - trainingSubDF: to which volunteer the corresponding line in the training
#   set refers

trainingDF <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingActDF <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
trainingSubDF <- read.table("UCI HAR Dataset/train/subject_train.txt")

# - testDF: the test set
# - testActDF: to which activity the corresponding line in the test
#   set refers
# - testSubDF: to which volunteer the corresponding line in the test
#   set refers
testDF <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActDF <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
testSubDF <- read.table("UCI HAR Dataset/test/subject_test.txt")

# - featuresDF: the complete list of variables names
# - activityNamesDF: lists the 6 activities and their numbers (these are the
#   numbers that appear in the testActDF and trainingActDF data frames)
featuresDF <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activityNamesDF <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Now we can finally get to the logical steps described in the beginning:

### 1. Merging the training and the test set in one data set.

# Combining data sets.
# - allDF: training and test data sets combined
# - allActDF: training and test activity references combined
allDF <- rbind(trainingDF, testDF)
allActDf <- rbind(trainingActDF, testActDF)

### 2. Extracting only the measurements on the mean and standard deviation
###    for each measurement.

# Setting columns names
names(allDF) <- featuresDF[[2]]

# What columns have means and standard deviations? (\\b is a regex boundary)
colsMeansStd <- grep('\\bmean\\b|\\bstd\\b', names(allDF))

# Keeping just these columns
allDF <- allDF[colsMeansStd]

### 3. Using descriptive activity names to name the activities in the data
###    set

# A factor of activities becomes a column in the combined data frame. Now
# each vector in the data set has its corresponding activity assigned to it.
activityFactor <- activityNamesDF[allActDf$activity, 2]
allDF <- cbind(activity=activityFactor, allDF)

### 4. Appropriately labeling the data set with descriptive variable names

# Already done in step 2.
#
# Since the variables of interest (the ones with means and standard
# deviations) were selected by name in step 2, the names had to be
# descriptive since that point. If the names had been selected by position,
# now would be the moment to correctly name the variables.

### 5. From the data set in step 4, creating a second, independent tidy data
###    set with the average of each variable for each activity and each
###    subject.

# To be able to average each variable for each activity and each subject we
# first need to add the subjects in the combined data frame.

# Adding subjects to the DF
allSubDF <- rbind(trainingSubDF, testSubDF)
allDF <- cbind(subject=allSubDF$V1, allDF)

# Now we can create the final tidy data set.
tidyDataSet <- aggregate(by = list(Subject=allDF$subject, Activity=allDF$activity),
                         x = allDF[, -c(1:2)],
                         FUN = mean)

# In dplyr it would look like:
#
# tidyDataSet = allDF %>%
#               group_by(subject, activity) %>%
#               summarise_each(funs(mean))
#
# But since the whole script was made in "pure" R, I used aggregate()
# to keep it in that way.
