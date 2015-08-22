# README.md  

This repository contains 5 files:

* README.md - This text file describing the repo contents and general notes
* CodeBook.md - Text file containing important information about the source and output data and how it was created.  It includes 1) available information about the provided source data files (mostly in the CodeBook appendix at the end of file, 2) describes each step performed to clean and transform the source data files into the desired output data set manually and in the R script file, 3) defines the output data variables.
* run_analysis.R - R Script (text file) used to clean and transform the source data files into the output data set.  There is only one script to perform all the work.  It does not invoke other scripts or require other steps beyond the manual file preparation steps described below.  (Note that I might normally separate some steps into a separate "subroutine" script but chose not to for the convenience of the reader).
* HARavg.txt - Output tidy data set containing the average (mean) of each mean and standard deviation variable grouped by the Subject Id and Activity Name.  180 rows X 68 columns.  This file is included in the Github Repo for convenienc, but was also submitted directly for the course project assignment as required.
* HARavg.csv - Optional file containing same tidy set as HARavg.txt but in CSV format ready to read into an Excel spreadsheet for easier visual inspection (e.g., set column widths or sort data).  Contains one additional column of "row names" (i.e., the row numbers 1:180).

#Tidy Data Set

Name: HARavg.txt (or alternate HARavg.csv)
Contents: 180 rows (observations) and 68 columns (identifiers and variable measured) plus a header row with column names.

The tidy data set is provided in wide format.  Either a wide or a long form of the data is acceptable if it meets the tidy data principles. This data set contains each variable measured in a separate column and each different summarized observation of those variables is in a different row (by subject and activity.

#Data Acquisition and Staging

Please note that the R script assumes that the source data files have been downloaded (.zip file) and unpacked in the a working directory on a device where the script can be run.  Output data file are written to the same working directory.  The following manual steps were performed to acquire and stage the data.  These are also included as comments in the R script.

 1) Setup Project Directories
      dir.create("~/coursera/Getting and Cleaning Data/Course Project")
      setwd("~/coursera/Getting and Cleaning Data/Course Project")
      if (!file.exists("UCI HAR Dataset")) { dir.create("./UCI HAR Dataset") }
    
 2) Download Project Data Files
      fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
      download.file(fileURL, destfile = ".")
      dateDownloaded <- date()
      dateDownloaded
      list.files("./data")
       
 3) Unpack the .zip file - done manually in Windows File Manager
    This script expects to find these 8 files in working directory:
    
      activity_labels.txt 
      features.txt
      test/y_test.txt 
      test/x_test.txt 
      test/subject_test.txt 
      train/y_train.txt 
      train/x_train.txt 
      train/subject_train.txt  
    
 4) IMPORTANT:
     Set working directory to location of unpacked source files
     before running this script. For me that is:
     setwd("~/coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset")

#The Code Book

This is the most important document and should be reviewed carefully before using the provided output summary data set.  As noted above, it provides information about the source and output data and how it was created.

* It includes available information about the provided source data files (mostly in the CodeBook appendix at the end of file)
* It describes each step performed to clean and transform the source data files into the desired output data set manually and in the R script file.
* It defines the output data variables in more detail.

If you have any difficulty following this README file or the script and Code Book in the repo that explained what the analysis files did, please contact the author (Dave9) on Github.
