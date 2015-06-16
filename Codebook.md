# Code Book
This file describes the raw data and its source as well as the summarizations applied to this data to transform it in a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) ready for analisys. The variables of the tidy data set and its meanings are described too.

## Raw Data Source
A zip file with the original data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Its original description is available in the [UCI web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Raw Data Information
Detailed information about the data set can be found in the README.txt file included in the data set. Succinctly, the orginal data set is from a set of experiments about human activity recognition using smartphones. The experiments have been carried out with a group of 30 volunteers. Each volunteer performed six activities wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, were captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The accelerometer and gyroscope signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The acceleration signal was divided in its gravitational and body motion components. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See "features_info.txt" included in the data set for more details about the features in the original data set.

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Each feature vector is a row on the text file. Features are normalized and bounded within [-1,1].

The files are organized as follows:

```
UCI HAR Dataset
├── activity_labels.txt                 the 6 activities and its labels
├── features_info.txt                   description of the features calculated for each window
├── features.txt                        the 561 features and its labels
├── README.txt                          general info about the data set
├── test                                directory with the test set
│   ├── Inertial Signals
│   │   ├── body_acc_x_test.txt
│   │   ├── body_acc_y_test.txt
│   │   ├── body_acc_z_test.txt
│   │   ├── body_gyro_x_test.txt
│   │   ├── body_gyro_y_test.txt
│   │   ├── body_gyro_z_test.txt
│   │   ├── total_acc_x_test.txt
│   │   ├── total_acc_y_test.txt
│   │   └── total_acc_z_test.txt
│   ├── subject_test.txt                volunteer labels for vectors of the test set
│   ├── X_test.txt                      feature vectors of the test set
│   └── y_test.txt                      activity labels for vectors of the test set
└── train                               directory with the training set
    ├── Inertial Signals
    │   ├── body_acc_x_train.txt
    │   ├── body_acc_y_train.txt
    │   ├── body_acc_z_train.txt
    │   ├── body_gyro_x_train.txt
    │   ├── body_gyro_y_train.txt
    │   ├── body_gyro_z_train.txt
    │   ├── total_acc_x_train.txt
    │   ├── total_acc_y_train.txt
    │   └── total_acc_z_train.txt
    ├── subject_train.txt               volunteer labels for vectors of the training set
    ├── X_train.txt                     feature vectors of the training set
    └── y_train.txt                     activity labels for vectors of the training set
```

## Transformation Info
* The training (`X_train.txt`) and the test (`X_test.txt`) data sets were merged to form one data set containing all the feature vectors of the UCI data set.
* Then, each feature in this resulting data set were identified accordingly to ``features.txt`` file. This allowed to filter out by name only the vectors that refer to means and standard deviations of measurements. Only these data were kept.
* The activity labels (`y_train.txt` and `y_test.txt`) were binded together with the data set and appropriately labeled with descriptive names (`activity_labels.txt`), to identify the activity corresponding to each vector.
* The last entity of the study, the volunteers (`subject_train.txt` and `subject_test.txt`), were binded as well in the data set to allow to identify the subject and the activity to which correspond each feature vector. How all these pieces of information form this data set is nicely represented by the following diagram by [David Hood](https://class.coursera.org/getdata-015/forum/thread?thread_id=112#comment-276):
![Which is the role of each file in the UCI data set](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png)
* From this data set were created a tidy data set with the average of each variable for each activity and each subject. This data set has one column per variable and one line per observation and therefore is [tidy](http://vita.had.co.nz/papers/tidy-data.pdf) as described by [Hadley Wickham](http://had.co.nz/). The variables in the resulting tidy data set are listed below.

## Code Book
