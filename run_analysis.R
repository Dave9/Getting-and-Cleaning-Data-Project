run_analysis <- function() {
    #Course Project Assignment for Getting and Cleaning Data
    #
    #You should create one R script called run_analysis.R that does the following.
    # 1. Merges the training and the test sets to create one data set.
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    # 3. Uses descriptive activity names to name the activities in the data set
    #      Note: This step is actually performed after Step 4 below
    # 4. Appropriately labels the data set with descriptive variable names.
    # 5. From the data set in step 4, creates a second, independent tidy data
    #    set with the average of each variable for each activity and each subject.

    #The following steps were performed manually to retrieve and
    #unpack the required data files before running this script
    
    # BEGIN MANUAL STEPS
    #
    #Setup Project Directories
    # dir.create("~/dmiller personal/coursera/Getting and Cleaning Data/Course Project")
    # setwd("~/dmiller personal/coursera/Getting and Cleaning Data/Course Project")
    # if (!file.exists("UCI HAR Dataset")) { dir.create("./UCI HAR Dataset") }
    #
    #Download Project Data Files
    # fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
    # download.file(fileURL, destfile = ".")
    # dateDownloaded <- date()
    # dateDownloaded
    # list.files("./data")
    #    
    #Unpack the .zip file - done manually in Windows File Manager
    #This script expects to find these 8 files in working directory:
    #
    #  activity_labels.txt 
    #  features.txt
    #  test/y_test.txt 
    #  test/x_test.txt 
    #  test/subject_test.txt 
    #  train/y_train.txt 
    #  train/x_train.txt 
    #  train/subject_train.txt  
    #
    # END MANUAL STEPS
    
    #IMPORTANT:
    # Set working directory to location of unpacked source files
    # before running this script. For me that is:
    # setwd("~/dmiller personal/coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset")

    #Load required libraries
    library(data.table)
    library(dplyr)
    
    #Load all files into data.tables or data.frames
    act_label <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
    y_test <- read.table("test/y_test.txt")
    x_test <- read.table("test/x_test.txt")
    subject_test <- read.table("test/subject_test.txt")
    y_train <- read.table("train/y_train.txt")
    x_train <- read.table("train/x_train.txt")
    subject_train <- read.table("train/subject_train.txt")
    
    #Profile the data in each file
    # See my_analysis.R for my work on this
    dim(y_test)
    dim(x_test)
    dim(subject_test)
    dim(y_train)
    dim(x_train)
    dim(subject_train)
    dim(features)
    dim(act_label)
    
    #Tag rows in each file with new SourceFile variable (tracability)
    x_test <- mutate(x_test, SourceFile="x_test")
    x_train <- mutate(x_train, SourceFile="x_train")
    
    #cbind test tables subject_text (subject), y_test (activity), x_test (measurement data)
    all_test <- cbind(subject_test, y_test, x_test)
    dim(all_test)
    
    #cbind train tables subject_text (subject), y_train (activity), x_train (measurement data)
    all_train <- cbind(subject_train, y_train, x_train)
    dim(all_train)
    
    #rbind all_test table and all_train table
    HARdata <- rbind(all_test, all_train)
    dim(HARdata)

    #Keep only rows containing mean or standard deviation (std)
    keepcols <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 
                215:216, 229:230, 242:243, 255:256, 268:273, 
                347:352, 426:431, 505:506, 518:519, 531:532, 
                544:545, 564)
    HARdata <- HARdata[,keepcols]
    dim(HARdata)
    
    #create replacement string for retained columns including
    #subject, activity, all mean and std columns and sourcefile
    colnames <- c("subject",
                "act_id",
                "tBody.Linear.Acceleration.mean.X",
                "tBody.Linear.Acceleration.mean.Y",
                "tBody.Linear.Acceleration.mean.Z",
                "tBody.Linear.Acceleration.stddev.X",
                "tBody.Linear.Acceleration.stddev.Y",
                "tBody.Linear.Acceleration.stddev.Z",
                "tGravity.Linear.Acceleration.mean.X",
                "tGravity.Linear.Acceleration.mean.Y",
                "tGravity.Linear.Acceleration.mean.Z",
                "tGravity.Linear.Acceleration.stddev.X",
                "tGravity.Linear.Acceleration.stddev.Y",
                "tGravity.Linear.Acceleration.stddev.Z",
                "tBody.Linear.Acceleration.Jerk.mean.X",
                "tBody.Linear.Acceleration.Jerk.mean.Y",
                "tBody.Linear.Acceleration.Jerk.mean.Z",
                "tBody.Linear.Acceleration.Jerk.stddev.X",
                "tBody.Linear.Acceleration.Jerk.stddev.Y",
                "tBody.Linear.Acceleration.Jerk.stddev.Z",
                "tBody.Gryoscopic.mean.X",
                "tBody.Gryoscopic.mean.Y",
                "tBody.Gryoscopic.mean.Z",
                "tBody.Gryoscopic.stddev.X",
                "tBody.Gryoscopic.stddev.Y",
                "tBody.Gryoscopic.stddev.Z",
                "tBody.Gryoscopic.Jerk.mean.X",
                "tBody.Gryoscopic.Jerk.mean.Y",
                "tBody.Gryoscopic.Jerk.mean.Z",
                "tBody.Gryoscopic.Jerk.stddev.X",
                "tBody.Gryoscopic.Jerk.stddev.Y",
                "tBody.Gryoscopic.Jerk.stddev.Z",
                "tBody.Linear.Acceleration.Magnitude.mean",
                "tBody.Linear.Acceleration.Magnitude.stddev",
                "tGravity.Linear.Acceleration.Magnitude.mean",
                "tGravity.Linear.Acceleration.Magnitude.stddev",
                "tBody.Linear.Acceleration.Jerk.Magnitude.mean",
                "tBody.Linear.Acceleration.Jerk.Magnitude.stddev",
                "tBody.Gryoscopic.Magnitude.mean",
                "tBody.Gryoscopic.Magnitude.stddev",
                "tBody.Gryoscopic.Jerk.Magnitude.mean",
                "tBody.Gryoscopic.Jerk.Magnitude.stddev",
                "fBody.Linear.Acceleration.mean.X",
                "fBody.Linear.Acceleration.mean.Y",
                "fBody.Linear.Acceleration.mean.Z",
                "fBody.Linear.Acceleration.stddev.X",
                "fBody.Linear.Acceleration.stddev.Y",
                "fBody.Linear.Acceleration.stddev.Z",
                "fBody.Linear.Acceleration.Jerk.mean.X",
                "fBody.Linear.Acceleration.Jerk.mean.Y",
                "fBody.Linear.Acceleration.Jerk.mean.Z",
                "fBody.Linear.Acceleration.Jerk.stddev.X",
                "fBody.Linear.Acceleration.Jerk.stddev.Y",
                "fBody.Linear.Acceleration.Jerk.stddev.Z",
                "fBody.Gryoscopic.mean.X",
                "fBody.Gryoscopic.mean.Y",
                "fBody.Gryoscopic.mean.Z",
                "fBody.Gryoscopic.stddev.X",
                "fBody.Gryoscopic.stddev.Y",
                "fBody.Gryoscopic.stddev.Z",
                "fBody.Linear.Acceleration.Magnitude.mean",
                "fBody.Linear.Acceleration.Magnitude.stddev",
                "fBody.Linear.Acceleration.Jerk.Magnitude.mean",
                "fBody.Linear.Acceleration.Jerk.Magnitude.stddev",
                "fBody.Gryoscopic.Magnitude.mean",
                "fBody.Gryoscopic.Magnitude.stddev",
                "fBody.Gryoscopic.Jerk.Magnitude.mean",
                "fBody.Gryoscopic.Jerk.Magnitude.stddev",
                "sourcefile")
    #
    setnames(HARdata, colnames)
    #names(HARdata)
    
    #join activity label to new table on y-table value (ie, activity #)
    setnames(act_label, c("act_id", "activity_name"))
    HARdata <- merge(act_label, HARdata, by.x="act_id", 
                     by.y="act_id", all=TRUE)
    #names(HARdata)
    #dim(HARdata)
    
    #Creates another data set from HARdata containing the average of
    #each variable for each activity and each subject.
    temp <- group_by(HARdata, subject, activity_name)
    HARavg <- summarize(temp, 
        tBody.Linear.Acceleration.mean.X = mean(tBody.Linear.Acceleration.mean.X),
        tBody.Linear.Acceleration.mean.Y = mean(tBody.Linear.Acceleration.mean.Y),
        tBody.Linear.Acceleration.mean.Z = mean(tBody.Linear.Acceleration.mean.Z))
    dim(HARavg)
    
    write.table(HARavg, file="HARavg.txt", row.name=FALSE)
    
    #Return HARavg data set as function output
    HARavg
}
