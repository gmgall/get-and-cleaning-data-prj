# Code Book
This file describes the raw data and its source as well as the summarizations applied to this data to transform it in a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) ready for analisys. The variables of the tidy data set and its meanings are described too.

## Raw Data Source
A zip file with the original data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Its original description is available in the [UCI web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Raw Data Information
Detailed information about the data set can be found in the `README.txt` file included in the data set. Succinctly, the orginal data set is from a set of experiments about human activity recognition using smartphones. The experiments have been carried out with a group of 30 volunteers. Each volunteer performed six activities wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, were captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The accelerometer and gyroscope signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The acceleration signal was divided in its gravitational and body motion components. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See `features_info.txt` included in the data set for more details about the features in the original data set.

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
* The activity labels (`y_train.txt` and `y_test.txt`) were binded together with the data set and appropriately labeled with descriptive names (`activity_labels.txt`) to identify the activity corresponding to each vector.
* The last entity of the study, the volunteers (`subject_train.txt` and `subject_test.txt`), were binded as well in the data set to allow to identify the subject and the activity to which correspond each feature vector. How all these pieces of information form this data set is nicely represented by the following diagram by [David Hood](https://class.coursera.org/getdata-015/forum/thread?thread_id=112#comment-276):
![Which is the role of each file in the UCI data set](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png)
* From this data set were created a tidy data set with the average of each variable for each activity and each subject. This data set has one column per variable and one line per observation and therefore is [tidy](http://vita.had.co.nz/papers/tidy-data.pdf) as described by [Hadley Wickham](http://had.co.nz/). The variables in the resulting tidy data set are listed below.

These transformations were made with the [run_analysis.R](./run_analysis.R) [R](http://www.r-project.org/) script. Its source code is thoroughly commented. If you want informations about the R data structures used to make these transformations and how they were merged, read the source code.

## Code Book
Below all variables in **bold** are from the output tidy data set and in `monospaced font` refers to the original UCI data set.

* **Subject:** Identifies the volunteer. Varies from 1 to 30.

* **Activity:** Identifies the activity performed. Has 6 possible values:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING


* **tBodyAcc.mean.X:** Mean of the variable `tBodyAcc-mean()-X` from the UCI data set. `tBodyAcc-mean()-X` is the mean of the body acceleration signal in X axis (time domain variable).

* **tBodyAcc.mean.Y:** Mean of the variable `tBodyAcc-mean()-Y` from the UCI data set. `tBodyAcc-mean()-Y` is the mean of the body acceleration signal in Y axis (time domain variable).

* **tBodyAcc.mean.Z:** Mean of the variable `tBodyAcc-mean()-Z` from the UCI data set. `tBodyAcc-mean()-Z` is the mean of the body acceleration signal in Z axis (time domain variable).

* **tBodyAcc.std.X:** Mean of the variable `tBodyAcc-std()-X` from the UCI data set. `tBodyAcc-std()-X` is the standard deviation of the body acceleration signal in X axis (time domain variable).

* **tBodyAcc.std.Y:** Mean of the variable `tBodyAcc-std()-Y` from the UCI data set. `tBodyAcc-std()-Y` is the standard deviation of the body acceleration signal in Y axis (time domain variable).

* **tBodyAcc.std.Z:** Mean of the variable `tBodyAcc-std()-Z` from the UCI data set. `tBodyAcc-std()-Z` is the standard deviation of the body acceleration signal in Z axis (time domain variable).

* **tGravityAcc.mean.X:** Mean of the variable `tGravityAcc-mean()-X` from the UCI data set. `tGravityAcc-mean()-X` is the mean of the gravity acceleration signal in X axis.

* **tGravityAcc.mean.Y:** Mean of the variable `tGravityAcc-mean()-Y` from the UCI data set. `tGravityAcc-mean()-Y` is the mean of the gravity acceleration signal in Y axis.

* **tGravityAcc.mean.Z:** Mean of the variable `tGravityAcc-mean()-Z` from the UCI data set. `tGravityAcc-mean()-Z` is the mean of the gravity acceleration signal in Z axis.

* **tGravityAcc.std.X:** Mean of the variable `tGravityAcc-std()-X` from the UCI data set. `tGravityAcc-std()-X` is the standard deviation of the gravity acceleration signal in X axis (time domain variable).

* **tGravityAcc.std.Y:** Mean of the variable `tGravityAcc-std()-Y` from the UCI data set. `tGravityAcc-std()-Y` is the standard deviation of the gravity acceleration signal in Y axis (time domain variable).

* **tGravityAcc.std.Z:** Mean of the variable `tGravityAcc-std()-Z` from the UCI data set. `tGravityAcc-std()-Z` is the standard deviation of the gravity acceleration signal in Z axis (time domain variable).

* **tBodyAccJerk.mean.X:** Mean of the variable `tBodyAccJerk-mean()-X` from the UCI data set. `tBodyAccJerk-mean()-X` is the mean of the Jerk signal obtained from deriving the body linear acceleration in X axis (time domain variable).

* **tBodyAccJerk.mean.Y:** Mean of the variable `tBodyAccJerk-mean()-Y` from the UCI data set. `tBodyAccJerk-mean()-Y` is the mean of the Jerk signal obtained from deriving the body linear acceleration in Y axis (time domain variable).

* **tBodyAccJerk.mean.Z:** Mean of the variable `tBodyAccJerk-mean()-Z` from the UCI data set. `tBodyAccJerk-mean()-Z` is the mean of the Jerk signal obtained from deriving the body linear acceleration in Z axis (time domain variable).

* **tBodyAccJerk.std.X:** Mean of the variable `tBodyAccJerk-std()-X` from the UCI data set. `tBodyAccJerk-std()-X` is the standard deviation of the Jerk signal obtained from deriving the body linear acceleration in X axis (time domain variable).

* **tBodyAccJerk.std.Y:** Mean of the variable `tBodyAccJerk-std()-Y` from the UCI data set. `tBodyAccJerk-std()-Y` is the standard deviation of the Jerk signal obtained from deriving the body linear acceleration in Y axis (time domain variable).

* **tBodyAccJerk.std.Z:** Mean of the variable `tBodyAccJerk-std()-Z` from the UCI data set. `tBodyAccJerk-std()-Z` is the standard deviation of the Jerk signal obtained from deriving the body linear acceleration in Z axis (time domain variable).

* **tBodyGyro.mean.X:** Mean of the variable `tBodyGyro-mean()-X` from the UCI data set. `tBodyGyro-mean()-X` is the mean of the body angular velocity signal in X axis (time domain variable).

* **tBodyGyro.mean.Y:** Mean of the variable `tBodyGyro-mean()-Y` from the UCI data set. `tBodyGyro-mean()-Y` is the mean of the body angular velocity signal in Y axis (time domain variable).

* **tBodyGyro.mean.Z:** Mean of the variable `tBodyGyro-mean()-Z` from the UCI data set. `tBodyGyro-mean()-Z` is the mean of the body angular velocity signal in Z axis (time domain variable).

* **tBodyGyro.std.X:** Mean of the variable `tBodyGyro-std()-X` from the UCI data set. `tBodyGyro-std()-X` is the standard deviation of the body angular velocity signal in X axis (time domain variable).

* **tBodyGyro.std.Y:** Mean of the variable `tBodyGyro-std()-Y` from the UCI data set. `tBodyGyro-std()-Y` is the standard deviation of the body angular velocity signal in Y axis (time domain variable).

* **tBodyGyro.std.Z:** Mean of the variable `tBodyGyro-std()-Z` from the UCI data set. `tBodyGyro-std()-Z` is the standard deviation of the body angular velocity signal in Z axis (time domain variable).

* **tBodyGyroJerk.mean.X:** Mean of the variable `tBodyGyroJerk-mean()-X` from the UCI data set. `tBodyGyroJerk-mean()-X` is the mean of the Jerk signal obtained from deriving the body angular velocity in X axis (time domain variable).

* **tBodyGyroJerk.mean.Y:** Mean of the variable `tBodyGyroJerk-mean()-Y` from the UCI data set. `tBodyGyroJerk-mean()-Y` is the mean of the Jerk signal obtained from deriving the body angular velocity in Y axis (time domain variable).

* **tBodyGyroJerk.mean.Z:** Mean of the variable `tBodyGyroJerk-mean()-Z` from the UCI data set. `tBodyGyroJerk-mean()-Z` is the mean of the Jerk signal obtained from deriving the body angular velocity in Z axis (time domain variable).

* **tBodyGyroJerk.std.X:** Mean of the variable `tBodyGyroJerk-std()-X` from the UCI data set. `tBodyGyroJerk-std()-X` is the standard deviation of the Jerk signal obtained from deriving the body angular velocity in X axis (time domain variable).

* **tBodyGyroJerk.std.Y:** Mean of the variable `tBodyGyroJerk-std()-Y` from the UCI data set. `tBodyGyroJerk-std()-Y` is the standard deviation of the Jerk signal obtained from deriving the body angular velocity in Y axis (time domain variable).

* **tBodyGyroJerk.std.Z:** Mean of the variable `tBodyGyroJerk-std()-Z` from the UCI data set. `tBodyGyroJerk-std()-Z` is the standard deviation of the Jerk signal obtained from deriving the body angular velocity in Z axis (time domain variable).

* **tBodyAccMag.mean:** Mean of the variable `tBodyAccMag-mean()` from the UCI data set. `tBodyAccMag-mean()` is the mean of the magnitude of the body acceleration signal (time domain variable).

* **tBodyAccMag.std:** Mean of the variable `tBodyAccMag-std()` from the UCI data set. `tBodyAccMag-std()` is the standard deviation of the magnitude of the body acceleration signal (time domain variable).

* **tGravityAccMag.mean:** Mean of the variable `tGravityAccMag-mean()` from the UCI data set. `tGravityAccMag-mean()` is the mean of the magnitude of the gravity acceleration signal (time domain variable).

* **tGravityAccMag.std:** Mean of the variable `tGravityAccMag-std()` from the UCI data set. `tGravityAccMag-std()` is the standard deviation of the magnitude of the gravity acceleration signal (time domain variable).

* **tBodyAccJerkMag.mean:** Mean of the variable `tBodyAccJerkMag-mean()` from the UCI data set. `tBodyAccJerkMag-mean()` is the mean of the Jerk signal of the magnitude of the body acceleration signal (time domain variable).

* **tBodyAccJerkMag.std:** Mean of the variable `tBodyAccJerkMag-std()` from the UCI data set. `tBodyAccJerkMag-std()` is the standard deviation of the Jerk signal of the magnitude of the body acceleration signal (time domain variable).

* **tBodyGyroMag.mean:** Mean of the variable `tBodyGyroMag-mean()` from the UCI data set. `tBodyGyroMag-mean()` is the mean of the magnitude of the body angular velocity signal (time domain variable).

* **tBodyGyroMag.std:** Mean of the variable `tBodyGyroMag-std()` from the UCI data set. `tBodyGyroMag-std()` is the standard deviation of the magnitude of the body angular velocity signal (time domain variable).

* **tBodyGyroJerkMag.mean:** Mean of the variable `tBodyGyroJerkMag-mean()` from the UCI data set. `tBodyGyroJerkMag-mean()` is the mean of the Jerk signal of the magnitude of the body angular velocity signal (time domain variable).

* **tBodyGyroJerkMag.std:** Mean of the variable `tBodyGyroJerkMag-std()` from the UCI data set. `tBodyGyroJerkMag-std()` is the standard deviation of the Jerk signal of the magnitude of the body angular velocity signal (time domain variable).

* **fBodyAcc.mean.X:** Mean of the variable `fBodyAcc-mean()-X` from the UCI data set. `fBodyAcc-mean()-X` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed body acceleration signal in X axis (frequency domain variable).

* **fBodyAcc.mean.Y:** Mean of the variable `fBodyAcc-mean()-Y` from the UCI data set. `fBodyAcc-mean()-Y` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed body acceleration signal in Y axis (frequency domain variable).

* **fBodyAcc.mean.Z:** Mean of the variable `fBodyAcc-mean()-Z` from the UCI data set. `fBodyAcc-mean()-Z` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed body acceleration signal in Z axis (frequency domain variable).

* **fBodyAcc.std.X:** Mean of the variable `fBodyAcc-std()-X` from the UCI data set. `fBodyAcc-std()-X` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed body acceleration signal in X axis (frequency domain variable).

* **fBodyAcc.std.Y:** Mean of the variable `fBodyAcc-std()-Y` from the UCI data set. `fBodyAcc-std()-Y` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed body acceleration signal in Y axis (frequency domain variable).

* **fBodyAcc.std.Z:** Mean of the variable `fBodyAcc-std()-Z` from the UCI data set. `fBodyAcc-std()-Z` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed body acceleration signal in Z axis (frequency domain variable).

* **fBodyAccJerk.mean.X:** Mean of the variable `fBodyAccJerk-mean()-X` from the UCI data set. `fBodyAccJerk-mean()-X` is the mean of  [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerk` signal in X axis (frequency domain variable).

* **fBodyAccJerk.mean.Y:** Mean of the variable `fBodyAccJerk-mean()-Y` from the UCI data set. `fBodyAccJerk-mean()-Y` is the mean of  [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerk` signal in X axis (frequency domain variable).

* **fBodyAccJerk.mean.Z:** Mean of the variable `fBodyAccJerk-mean()-Z` from the UCI data set. `fBodyAccJerk-mean()-Z` is the mean of  [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerk` signal in Z axis (frequency domain variable).

* **fBodyAccJerk.std.X:** Mean of the variable `fBodyAccJerk-std()-X` from the UCI data set. `fBodyAccJerk-std()-X` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerk` signal in X axis (frequency domain variable).

* **fBodyAccJerk.std.Y:** Mean of the variable `fBodyAccJerk-std()-Y` from the UCI data set. `fBodyAccJerk-std()-Y` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerk` signal in Y axis (frequency domain variable).

* **fBodyAccJerk.std.Z:** Mean of the variable `fBodyAccJerk-std()-Z` from the UCI data set. `fBodyAccJerk-std()-Z` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerk` signal in Z axis (frequency domain variable).

* **fBodyGyro.mean.X:** Mean of the variable `fBodyGyro-mean()-X` from the UCI data set. `fBodyGyro-mean()-X` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyro` signal in X axis (frequency domain variable).

* **fBodyGyro.mean.Y:** Mean of the variable `fBodyGyro-mean()-Y` from the UCI data set. `fBodyGyro-mean()-Y` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyro` signal in Y axis (frequency domain variable).

* **fBodyGyro.mean.Z:** Mean of the variable `fBodyGyro-mean()-Z` from the UCI data set. `fBodyGyro-mean()-Z` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyro` signal in Z axis (frequency domain variable).

* **fBodyGyro.std.X:** Mean of the variable `fBodyGyro-std()-X` from the UCI data set. `fBodyGyro-std()-X` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyro` signal in X axis (frequency domain variable).

* **fBodyGyro.std.Y:** Mean of the variable `fBodyGyro-std()-Y` from the UCI data set. `fBodyGyro-std()-Y` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyro` signal in Y axis (frequency domain variable).

* **fBodyGyro.std.Z:** Mean of the variable `fBodyGyro-std()-Z` from the UCI data set. `fBodyGyro-std()-Z` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyro` signal in Z axis (frequency domain variable).

* **fBodyAccMag.mean:** Mean of the variable `fBodyAccMag-mean()` from the UCI data set. `fBodyAccMag-mean()` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccMag` (frequency domain variable).

* **fBodyAccMag.std:** Mean of the variable `fBodyAccMag-std()` from the UCI data set. `fBodyAccMag-std()` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccMag` (frequency domain variable).

* **fBodyAccJerkMag.mean:** Mean of the variable `fBodyBodyAccJerkMag-mean()` from the UCI data set. `fBodyBodyAccJerkMag-mean()` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerkMag` (frequency domain variable). *Note that this variable has 'Body' duplicated in its name in the UCI data set. The mean of this variable was named in the output tidy data set with the string 'Body' appearing just once.*

* **fBodyAccJerkMag.std:** Mean of the variable `fBodyBodyAccJerkMag-std()` from the UCI data set. `fBodyBodyAccJerkMag-std()` is the stardard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyAccJerkMag` (frequency domain variable). *Note that this variable has 'Body' duplicated in its name in the UCI data set. The mean of this variable was named in the output tidy data set with the string 'Body' appearing just once.*

* **fBodyGyroMag.mean:** Mean of the variable `fBodyBodyGyroMag-mean()` from the UCI data set. `fBodyBodyGyroMag-mean()` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyroMag` (frequency domain variable). *Note that this variable has 'Body' duplicated in its name in the UCI data set. The mean of this variable was named in the output tidy data set with the string 'Body' appearing just once.*

* **fBodyGyroMag.std:** Mean of the variable `fBodyBodyGyroMag-std()` from the UCI data set. `fBodyBodyGyroMag-std()` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyroMag` (frequency domain variable). *Note that this variable has 'Body' duplicated in its name in the UCI data set. The mean of this variable was named in the output tidy data set with the string 'Body' appearing just once.*

* **fBodyGyroJerkMag.mean:** Mean of the variable `fBodyBodyGyroJerkMag-mean()` from the UCI data set. `fBodyBodyGyroJerkMag-mean()` is the mean of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyroJerkMag` (frequency domain variable). *Note that this variable has 'Body' duplicated in its name in the UCI data set. The mean of this variable was named in the output tidy data set with the string 'Body' appearing just once.*

* **fBodyGyroJerkMag.std:** Mean of the variable `fBodyBodyGyroJerkMag-std()` from the UCI data set. `fBodyBodyGyroJerkMag-std()` is the standard deviation of [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) transformed `tBodyGyroJerkMag` (frequency domain variable). *Note that this variable has 'Body' duplicated in its name in the UCI data set. The mean of this variable was named in the output tidy data set with the string 'Body' appearing just once.*