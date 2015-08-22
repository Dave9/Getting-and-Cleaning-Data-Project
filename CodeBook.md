#Code Book for Course Project

*Note that this file is incomplete*

Each variable you measure should be in one column
Each different observation of that variable should be in a different row
There should be one table for each "kind" of variable
If you have multiple tables, they should include a column in the table that allows them to be linked

include a row at the top of each data table/spreadsheet that contains full row names. So if you measured age at diagnosis for patients, you would head that column with the name AgeAtDiagnosis instead of something like ADx or another abbreviation that may be hard for another person to understand.

Human readable

If you are sharing your data with the collaborator in Excel, the tidy data should be in one Excel file per table. They should not have multiple worksheets, no macros should be applied to the data, and no columns/cells should be highlighted. Alternatively share the data in a CSV or TAB-delimited text file.

Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
Step 2 - run the software separately for each sample
Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set

how variable named
including BodyBody error

You should also include information about which system (Mac/Windows/Linux) you used the software on and whether you tried it more than once to confirm it gave the same results. Ideally, you will run this by a fellow student/labmate to confirm that they can obtain the same output file you did.

#Study Design
How the data was collected, transformed and summarized

#Data Sources
The data used for this study represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for this study are available for download at:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Data Cleansing
*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement. 
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names. 

#Data Summarization
*From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Inertial Signals not included and not required for this study
definition of mean and std chosen
not included angle and ??? (which is not actually a mean or std)

#Description of Variables

Subject.Id
Activity.Id
Body.Linear.Acceleration.TDS.mean.X
Body.Linear.Acceleration.TDS.mean.Y
Body.Linear.Acceleration.TDS.mean.Z
Body.Linear.Acceleration.TDS.stddev.X
Body.Linear.Acceleration.TDS.stddev.Y
Body.Linear.Acceleration.TDS.stddev.Z
Gravity.Linear.Acceleration.TDS.mean.X
Gravity.Linear.Acceleration.TDS.mean.Y
Gravity.Linear.Acceleration.TDS.mean.Z
Gravity.Linear.Acceleration.TDS.stddev.X
Gravity.Linear.Acceleration.TDS.stddev.Y
Gravity.Linear.Acceleration.TDS.stddev.Z
Body.Linear.Acceleration.Jerk.TDS.mean.X
Body.Linear.Acceleration.Jerk.TDS.mean.Y
Body.Linear.Acceleration.Jerk.TDS.mean.Z
Body.Linear.Acceleration.Jerk.TDS.stddev.X
Body.Linear.Acceleration.Jerk.TDS.stddev.Y
Body.Linear.Acceleration.Jerk.TDS.stddev.Z
Body.Gryoscopic.TDS.mean.X
Body.Gryoscopic.TDS.mean.Y
Body.Gryoscopic.TDS.mean.Z
Body.Gryoscopic.TDS.stddev.X
Body.Gryoscopic.TDS.stddev.Y
Body.Gryoscopic.TDS.stddev.Z
Body.Gryoscopic.Jerk.TDS.mean.X
Body.Gryoscopic.Jerk.TDS.mean.Y
Body.Gryoscopic.Jerk.TDS.mean.Z
Body.Gryoscopic.Jerk.TDS.stddev.X
Body.Gryoscopic.Jerk.TDS.stddev.Y
Body.Gryoscopic.Jerk.TDS.stddev.Z
Body.Linear.Acceleration.Magnitude.TDS.mean
Body.Linear.Acceleration.Magnitude.TDS.stddev
Gravity.Linear.Acceleration.Magnitude.TDS.mean
Gravity.Linear.Acceleration.Magnitude.TDS.stddev
Body.Linear.Acceleration.Jerk.Magnitude.TDS.mean
Body.Linear.Acceleration.Jerk.Magnitude.TDS.stddev
Body.Gryoscopic.Magnitude.TDS.mean
Body.Gryoscopic.Magnitude.TDS.stddev
Body.Gryoscopic.Jerk.Magnitude.TDS.mean
Body.Gryoscopic.Jerk.Magnitude.TDS.stddev
Body.Linear.Acceleration.FDS.mean.X
Body.Linear.Acceleration.FDS.mean.Y
Body.Linear.Acceleration.FDS.mean.Z
Body.Linear.Acceleration.FDS.stddev.X
Body.Linear.Acceleration.FDS.stddev.Y
Body.Linear.Acceleration.FDS.stddev.Z
Body.Linear.Acceleration.Jerk.FDS.mean.X
Body.Linear.Acceleration.Jerk.FDS.mean.Y
Body.Linear.Acceleration.Jerk.FDS.mean.Z
Body.Linear.Acceleration.Jerk.FDS.stddev.X
Body.Linear.Acceleration.Jerk.FDS.stddev.Y
Body.Linear.Acceleration.Jerk.FDS.stddev.Z
Body.Gryoscopic.FDS.mean.X
Body.Gryoscopic.FDS.mean.Y
Body.Gryoscopic.FDS.mean.Z
Body.Gryoscopic.FDS.stddev.X
Body.Gryoscopic.FDS.stddev.Y
Body.Gryoscopic.FDS.stddev.Z
Body.Linear.Acceleration.Magnitude.FDS.mean
Body.Linear.Acceleration.Magnitude.FDS.stddev
Body.Linear.Acceleration.Jerk.Magnitude.FDS.mean
Body.Linear.Acceleration.Jerk.Magnitude.FDS.stddev
Body.Gryoscopic.Magnitude.FDS.mean
Body.Gryoscopic.Magnitude.FDS.stddev
Body.Gryoscopic.Jerk.Magnitude.FDS.mean
Body.Gryoscopic.Jerk.Magnitude.FDS.stddev
Source.File


Submit a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

Was code book submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?



=========================================================================
APPENDIX: BACKGROUND INFORMATION ABOUT THE SOURCE DATA USED IN THIS STUDY
=========================================================================

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

The complete list of variables of each feature vector is available in 'features.txt'

