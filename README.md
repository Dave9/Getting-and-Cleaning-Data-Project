# README.md  

This repository contains 5 files:

* README.md - This text file describing the contents of this Github repository and general notes.
* CodeBook.md - Text file containing important information about the source and output data and how it was created.  It  
 1. includes available information about the provided source data files - mostly in the CodeBook appendix at the end of file
 2. describes each step performed to clean and transform the source data files into the desired output data set manually and using the R script
 3. defines the output data variables.
* run_analysis.R - R Script used to clean and transform the source data files into the output data set.  There is only one script to perform all the work.  It does not invoke other scripts or require other steps beyond the manual file preparation steps described below.  (I might normally separate some steps into a separately invoked script but chose not to for the convenience of the reviewer).
* HARavg.txt - Output tidy data set containing the average (mean) of each mean and standard deviation variable grouped by the Subject Id and Activity Name.  180 rows X 68 columns.  This file is included in the Github Repo for convenience, but was also submitted directly for the course project assignment as required.  See details in the CodeBook.
* HARavg.csv - This *optional* file contains the same tidy set as HARavg.txt but in CSV format ready to read into an Excel spreadsheet for easier visual inspection (e.g., set column widths or sort data).  Contains one additional unnamed column of "row names" (i.e., the row numbers 1:180).

##Key Decisions

1. **Data Submission Format**  The tidy data set (HARavg.txt) is provided in *wide format*.  Either a wide or a long form of the data is acceptable if it meets the tidy data principles. This data set is tidy because it contains each identifier (2) and variable measured (66) in 68 separate columns and each different summarized observation (180) of those variables is in a different row (by subject and activity). It also includes a header row with understandable column names. The text file is difficult to view visually on screen unformatted. You may prefer to open it or CSV version of it in Excel or another viewer.

2. **Data Acquisition and Staging**  The R script assumes that the source data files have been downloaded (.zip file) and unpacked in the a working directory on a device where the script can be run.  Output data file are written to the same working directory. The manual steps to setup and stage the data are described in the CodeBook (and included as comments in the R script).

3. **Variable Selection**  The instruction about selecting variables were open to interpretation: *Extract only the measurements on the mean and standard deviation*.  For this study, I chose to include only the variables specifically named as a "-mean()" or "-std()" and identified as the Mean value or Standard deviation in the source file code book.  I excluded other variables containing the string "mean", such as "meanFreq", "AccMean" and "gravityMean", which are not actually means of simple body movement measurements, but are instead frequency or gravity values as determined by reviewing documentation about the original study.  The supplementary Inertial Signals data files were not included in since they do not contain the desired mean and standard deviation measurements for my study.  The final selection includes 66 variables of the available 561 measurement variables.  The subject and activity identifiers were then added from the other files.

4. **Variable Naming**  For this study, I chose to name the variable with capitalized full words separated by period character(e.g., Body.Linear.Acceleration.TDS.mean.X) expanding on the accurate but terse abbreviations provided in the source data variable names.  I made one exception so that the names would not be excessively long - I used the abbreviations TDS for Time Data Series and FDS for Frequency Data Series, which replace the cryptic "t" and "f" character in the source names.

5. **Variable Name Replacement**  During my data analysis, I chose to extract all the variable names into an Excel spreadsheet and work with understanding and renaming them in Excel.  I then used only the selected new names in the R script to rename those source variables.  While it would have been possible to write detailed R commands to "automatically convert" the source names into my new names, I do not believe this is the best approach for variable names which require careful human review and decisions outside the programming environment.  Data, typically millions or billions of rows, must be programmatically altered in an R script when required.  Variable names, under 600 in this case, can be easily manipulated outside the script and shared with other non programmer subject matter experts.  The final instructions in the R script clearly show how the selected variables were renamed.  The Code Book further describes those variables and their derivation.

6. **The Code Book**  Please do review the included Code Book.  It is the most important document which provides specific details about the source data and how it was transformed and used to produce the output data set.


*And finally, thanks for reviewing my Getting and Cleaning Data course project submission!*
