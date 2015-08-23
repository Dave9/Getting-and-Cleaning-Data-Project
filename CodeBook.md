#Code Book for Course Project

##Study Design and Data Sources

This study is based on data collected in a previous study called *Human Activity Recognition Using Smartphones Dataset* based on experiments conducted with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist.  The data used for this study represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the original study and the data is available at the site:

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for this study are available for download at:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The descriptive information for the source data is *reproduced in the appendix of this CodeBook.*  You must be familiar with the original source data (or review the appendix) in order to understand the transformations and summarizations performed in this study.

For the purposed of this study, only the source mean and standard deviation results will be used.  That data will be further summarized over the individual test subjects and the activities they performed.  This CodeBook describes how the original data was selected and transformed to prepare for the next analysis phase of this study.

##Data Acquisition and Staging

The following manual steps were performed to acquire and stage the source data.  These are also included as comments in the R script.

 a. Setup Project Directories

      dir.create("~/coursera/Getting and Cleaning Data/Course Project")
      setwd("~/coursera/Getting and Cleaning Data/Course Project")
      if (!file.exists("UCI HAR Dataset")) { dir.create("./UCI HAR Dataset") }
    
 b. Download Project Data Files

      fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
      download.file(fileURL, destfile = ".")
      dateDownloaded <- date()
      dateDownloaded
      list.files("./data")
       
 c. Unpack the .zip file - done manually in Windows File Manager
    This script expects to find these 8 files in working directory:
    
      activity_labels.txt 
      features.txt
      test/y_test.txt 
      test/x_test.txt 
      test/subject_test.txt 
      train/y_train.txt 
      train/x_train.txt 
      train/subject_train.txt  
    
 d. IMPORTANT:
     Set working directory to location of unpacked source files
     before running this script. For me that is:
     setwd("~/coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset")

##Data Cleansing Steps

1. The source files contain information about the experiment observations separated into two sets (test data and training data) and further divided into three files each containing:

 * All the measurement variables (561) (source: x-* files)
 * Subject identifier (id only, no other demographics) (source: subject-* files)
 * Activity identifier (source: y-* files)

2. Each set of three source files (test and train) will first be merged (column-wise cbind) to create a single set of all variables.  The result is one larger file as a tidy data set containing all the variables and all the observations. Next, those files will be merged (row-wise rbind) to create a single set of all observations. This completes the requirement to *Merge the training and the test sets to create one data set.*

3. This study only requires selected mean and standard deviation measurements, defined as source variables named as a "-mean()" or "-std()" and identified as the Mean value or Standard deviation in the source file code book.  Excluded are other variables containing the string "mean", such as "meanFreq", "AccMean" and "gravityMean", which are not actually means of simple body movement measurements, but are instead frequency or gravity values as determined by reviewing documentation about the original study.  The supplementary Inertial Signals data files were not included in since they do not contain the desired mean and standard deviation measurements for my study.  The final selection includes 66 variables of the available 561 measurement variables.  These are subsetted out of the data_frame using a character vector of column number to retain.  This completes the requirement to *Extracts only the measurements on the mean and standard deviation for each measurement.*

4. Descriptive variable names were added to this new data file based on the variable names provided in a separate file (features.txt) from the original study.  The R script replaces the default variable names using using a character vector of the new names with setnames().  Variables are named with capitalized full words separated by period character(e.g., Body.Linear.Acceleration.TDS.mean.X) expanding on the accurate but terse abbreviations provided in the source data file.  Two common qualifiers were abbreviated as **TDS** for *Time Data Series* and **FDS** for *Frequency Data Series*.  This completes the requirement to *Label the data set with descriptive variable names. Note that this step is performed out of the suggested order from the original requirements* 

5. Descriptive activity names were added to the new data file matching the existing activity id in the file.  The descriptions are taken from the original source file containing activity id's and descriptions (activity_labels.txt).  This completes the requirement to *Use descriptive activity names to name the activities in the data set.*

##Data Summarization Steps

1. This study will only deal with summarized data showing the average (specifically the "mean") values for the data aggregated by subject and activity.  The final step of data preparation performs the group by and summarize operations to produce the final summarized data set.  The data set is output as a TXT file, and also as a supplementary CSV file.  This completes the requirement to *create a second, independent tidy data set with the average of each variable for each activity and each subject.*

##Description of Variables

The new variable names are mapped from the original source variable names (features.txt) as follows using the approach described above.  Note that the original name containing "BodyBody" was assumed to be in error and replaced with one "Body".  Subject Id and Activity Name were copied or transformed from their source files as described above.  A Source.File name (test or train) was added to the original source files before they were merged to maintain some tracability to the source file data rows, but this is of course not present in the final summarized output file.  **TDS** means *Time Data Series* and **FDS** means *Frequency Data Series* as described above.

Further description of the variable names is not provided since the new names are descriptive on their own.  Analysts using this data should consult the original source information (see the appendix of this document) for details about their meaning. 

##Variable Name Mapping

This table maps the Original Source Variables to New Study Variables in the output data set (HARavg.txt).  

|Source Variable Name|New Variable Name|
|--------------------|-----------------|
||Subject.Id
||Activity.Name
|tBodyAcc-mean()-X |Body.Linear.Acceleration.TDS.mean.X|
|tBodyAcc-mean()-Y |Body.Linear.Acceleration.TDS.mean.Y|
|tBodyAcc-mean()-Z |Body.Linear.Acceleration.TDS.mean.Z|
|tBodyAcc-std()-X |Body.Linear.Acceleration.TDS.stddev.X|
|tBodyAcc-std()-Y |Body.Linear.Acceleration.TDS.stddev.Y|
|tBodyAcc-std()-Z |Body.Linear.Acceleration.TDS.stddev.Z|
|tGravityAcc-mean()-X |Gravity.Linear.Acceleration.TDS.mean.X|
|tGravityAcc-mean()-Y |Gravity.Linear.Acceleration.TDS.mean.Y|
|tGravityAcc-mean()-Z |Gravity.Linear.Acceleration.TDS.mean.Z|
|tGravityAcc-std()-X |Gravity.Linear.Acceleration.TDS.stddev.X|
|tGravityAcc-std()-Y |Gravity.Linear.Acceleration.TDS.stddev.Y|
|tGravityAcc-std()-Z |Gravity.Linear.Acceleration.TDS.stddev.Z|
|tBodyAccJerk-mean()-X |Body.Linear.Acceleration.Jerk.TDS.mean.X|
|tBodyAccJerk-mean()-Y |Body.Linear.Acceleration.Jerk.TDS.mean.Y|
|tBodyAccJerk-mean()-Z |Body.Linear.Acceleration.Jerk.TDS.mean.Z|
|tBodyAccJerk-std()-X |Body.Linear.Acceleration.Jerk.TDS.stddev.X|
|tBodyAccJerk-std()-Y |Body.Linear.Acceleration.Jerk.TDS.stddev.Y|
|tBodyAccJerk-std()-Z |Body.Linear.Acceleration.Jerk.TDS.stddev.Z|
|tBodyGyro-mean()-X |Body.Gryoscopic.TDS.mean.X|
|tBodyGyro-mean()-Y |Body.Gryoscopic.TDS.mean.Y|
|tBodyGyro-mean()-Z |Body.Gryoscopic.TDS.mean.Z|
|tBodyGyro-std()-X |Body.Gryoscopic.TDS.stddev.X|
|tBodyGyro-std()-Y |Body.Gryoscopic.TDS.stddev.Y|
|tBodyGyro-std()-Z |Body.Gryoscopic.TDS.stddev.Z|
|tBodyGyroJerk-mean()-X |Body.Gryoscopic.Jerk.TDS.mean.X|
|tBodyGyroJerk-mean()-Y |Body.Gryoscopic.Jerk.TDS.mean.Y|
|tBodyGyroJerk-mean()-Z |Body.Gryoscopic.Jerk.TDS.mean.Z|
|tBodyGyroJerk-std()-X |Body.Gryoscopic.Jerk.TDS.stddev.X|
|tBodyGyroJerk-std()-Y |Body.Gryoscopic.Jerk.TDS.stddev.Y|
|tBodyGyroJerk-std()-Z |Body.Gryoscopic.Jerk.TDS.stddev.Z|
|tBodyAccMag-mean() |Body.Linear.Acceleration.Magnitude.TDS.mean|
|tBodyAccMag-std() |Body.Linear.Acceleration.Magnitude.TDS.stddev|
|tGravityAccMag-mean() |Gravity.Linear.Acceleration.Magnitude.TDS.mean|
|tGravityAccMag-std() |Gravity.Linear.Acceleration.Magnitude.TDS.stddev|
|tBodyAccJerkMag-mean() |Body.Linear.Acceleration.Jerk.Magnitude.TDS.mean|
|tBodyAccJerkMag-std() |Body.Linear.Acceleration.Jerk.Magnitude.TDS.stddev|
|tBodyGyroMag-mean() |Body.Gryoscopic.Magnitude.TDS.mean|
|tBodyGyroMag-std() |Body.Gryoscopic.Magnitude.TDS.stddev|
|tBodyGyroJerkMag-mean() |Body.Gryoscopic.Jerk.Magnitude.TDS.mean|
|tBodyGyroJerkMag-std() |Body.Gryoscopic.Jerk.Magnitude.TDS.stddev|
|fBodyAcc-mean()-X |Body.Linear.Acceleration.FDS.mean.X|
|fBodyAcc-mean()-Y |Body.Linear.Acceleration.FDS.mean.Y|
|fBodyAcc-mean()-Z |Body.Linear.Acceleration.FDS.mean.Z|
|fBodyAcc-std()-X |Body.Linear.Acceleration.FDS.stddev.X|
|fBodyAcc-std()-Y |Body.Linear.Acceleration.FDS.stddev.Y|
|fBodyAcc-std()-Z |Body.Linear.Acceleration.FDS.stddev.Z|
|fBodyAccJerk-mean()-X |Body.Linear.Acceleration.Jerk.FDS.mean.X|
|fBodyAccJerk-mean()-Y |Body.Linear.Acceleration.Jerk.FDS.mean.Y|
|fBodyAccJerk-mean()-Z |Body.Linear.Acceleration.Jerk.FDS.mean.Z|
|fBodyAccJerk-std()-X |Body.Linear.Acceleration.Jerk.FDS.stddev.X|
|fBodyAccJerk-std()-Y |Body.Linear.Acceleration.Jerk.FDS.stddev.Y|
|fBodyAccJerk-std()-Z |Body.Linear.Acceleration.Jerk.FDS.stddev.Z|
|fBodyGyro-mean()-X |Body.Gryoscopic.FDS.mean.X|
|fBodyGyro-mean()-Y |Body.Gryoscopic.FDS.mean.Y|
|fBodyGyro-mean()-Z |Body.Gryoscopic.FDS.mean.Z|
|fBodyGyro-std()-X |Body.Gryoscopic.FDS.stddev.X|
|fBodyGyro-std()-Y |Body.Gryoscopic.FDS.stddev.Y|
|fBodyGyro-std()-Z |Body.Gryoscopic.FDS.stddev.Z|
|fBodyAccMag-mean() |Body.Linear.Acceleration.Magnitude.FDS.mean|
|fBodyAccMag-std() |Body.Linear.Acceleration.Magnitude.FDS.stddev|
|fBodyBodyAccJerkMag-mean() |Body.Linear.Acceleration.Jerk.Magnitude.FDS.mean|
|fBodyBodyAccJerkMag-std() |Body.Linear.Acceleration.Jerk.Magnitude.FDS.stddev|
|fBodyBodyGyroMag-mean() |Body.Gryoscopic.Magnitude.FDS.mean|
|fBodyBodyGyroMag-std() |Body.Gryoscopic.Magnitude.FDS.stddev|
|fBodyBodyGyroJerkMag-mean() |Body.Gryoscopic.Jerk.Magnitude.FDS.mean|
|fBodyBodyGyroJerkMag-std() |Body.Gryoscopic.Jerk.Magnitude.FDS.stddev|



=========================================================================

=========================================================================

# Appendix

=========================================================================
APPENDIX: BACKGROUND INFORMATION ABOUT THE SOURCE DATA USED IN THIS STUDY
=========================================================================

*The information in this appendix may be viewed in it original form at the following website.  It is included here for the convenience of readers of this follow-on study.*

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Human Activity Recognition Using Smartphones Dataset - Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
===============================

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. [Note 1]
* Triaxial Angular velocity from the gyroscope. [Note 1]
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

[Note 1] These data were available in the source data set (in the test and train subdirectories named Inertial Signals, but they were not required by nor included in this study.  All other avialable data was initially included before reducing the study data set to mean and standard deviation measurements only.

The source dataset includes the following files:
================================================

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector (and reproduced in this appendix below).
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. [Note 2] 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Note that:
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

For more information about the source dataset contact: activityrecognition@smartlab.ws

[Note 2] See Note 1 above about Inertial Signal data not included in this study.

License for Source Data:
========================
Use of the source dataset (including this derivitive study) in other publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Feature Selection (see source file features_info.txt)
=====================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in file 'features.txt' in the source distribution linked above in this appendix.
