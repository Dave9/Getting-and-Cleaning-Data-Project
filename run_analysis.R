run_analysis <- function() {
    #Course Project Assignment for Getting and Cleaning Data
    #
    #Per the requirements of this study (course), this script:
    # 1. Merges the training and the test sets to create one data set.
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    # 3. Uses descriptive activity names to name the activities in the data set.
    #      (Note: I chose to perform this step after Step 4)
    # 4. Appropriately labels the data set with descriptive variable names.
    # 5. From the data set in step 4, creates a second, independent tidy data
    #    set with the average of each variable over activity and subject.

    #The following steps were performed manually to retrieve and
    #unpack the source data files before running this script.
    
    # BEGIN MANUAL STEPS
    #
    #Setup Project Directories
    # dir.create("~/dmiller personal/coursera/Getting and Cleaning Data/Course Project")
    # setwd("~/dmiller personal/coursera/Getting and Cleaning Data/Course Project")
    # if (!file.exists("UCI HAR Dataset")) { dir.create("./UCI HAR Dataset") }
    # setwd("~/dmiller personal/coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset")
    #
    #Download Project Data Files
    # fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
    # download.file(fileURL, destfile = ".")
    # dateDownloaded <- date()
    # dateDownloaded
    # list.files("./data")
    #    
    #Unpack the .zip file - done manually in Windows File Manager
    #This script expects to find these 8 files in the working directory:
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
    # before running this script.

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
    
    #Tag rows in each file with new Source.File variable (for tracability)
    x_test <- mutate(x_test, Source.File="x_test")
    x_train <- mutate(x_train, Source.File="x_train")
    
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
    # as well as subject and activity columns
    keepcols <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 
                215:216, 229:230, 242:243, 255:256, 268:273, 
                347:352, 426:431, 505:506, 518:519, 531:532, 
                544:545, 564)
    HARdata <- HARdata[,keepcols]
    dim(HARdata)
    
    #create replacement string for retained columns including
    #subject, activity, all mean and std columns and sourcefile
    colnames <- c("Subject.Id",
                "Activity.Id",
                "Body.Linear.Acceleration.TDS.mean.X",
                "Body.Linear.Acceleration.TDS.mean.Y",
                "Body.Linear.Acceleration.TDS.mean.Z",
                "Body.Linear.Acceleration.TDS.stddev.X",
                "Body.Linear.Acceleration.TDS.stddev.Y",
                "Body.Linear.Acceleration.TDS.stddev.Z",
                "Gravity.Linear.Acceleration.TDS.mean.X",
                "Gravity.Linear.Acceleration.TDS.mean.Y",
                "Gravity.Linear.Acceleration.TDS.mean.Z",
                "Gravity.Linear.Acceleration.TDS.stddev.X",
                "Gravity.Linear.Acceleration.TDS.stddev.Y",
                "Gravity.Linear.Acceleration.TDS.stddev.Z",
                "Body.Linear.Acceleration.Jerk.TDS.mean.X",
                "Body.Linear.Acceleration.Jerk.TDS.mean.Y",
                "Body.Linear.Acceleration.Jerk.TDS.mean.Z",
                "Body.Linear.Acceleration.Jerk.TDS.stddev.X",
                "Body.Linear.Acceleration.Jerk.TDS.stddev.Y",
                "Body.Linear.Acceleration.Jerk.TDS.stddev.Z",
                "Body.Gryoscopic.TDS.mean.X",
                "Body.Gryoscopic.TDS.mean.Y",
                "Body.Gryoscopic.TDS.mean.Z",
                "Body.Gryoscopic.TDS.stddev.X",
                "Body.Gryoscopic.TDS.stddev.Y",
                "Body.Gryoscopic.TDS.stddev.Z",
                "Body.Gryoscopic.Jerk.TDS.mean.X",
                "Body.Gryoscopic.Jerk.TDS.mean.Y",
                "Body.Gryoscopic.Jerk.TDS.mean.Z",
                "Body.Gryoscopic.Jerk.TDS.stddev.X",
                "Body.Gryoscopic.Jerk.TDS.stddev.Y",
                "Body.Gryoscopic.Jerk.TDS.stddev.Z",
                "Body.Linear.Acceleration.Magnitude.TDS.mean",
                "Body.Linear.Acceleration.Magnitude.TDS.stddev",
                "Gravity.Linear.Acceleration.Magnitude.TDS.mean",
                "Gravity.Linear.Acceleration.Magnitude.TDS.stddev",
                "Body.Linear.Acceleration.Jerk.Magnitude.TDS.mean",
                "Body.Linear.Acceleration.Jerk.Magnitude.TDS.stddev",
                "Body.Gryoscopic.Magnitude.TDS.mean",
                "Body.Gryoscopic.Magnitude.TDS.stddev",
                "Body.Gryoscopic.Jerk.Magnitude.TDS.mean",
                "Body.Gryoscopic.Jerk.Magnitude.TDS.stddev",
                "Body.Linear.Acceleration.FDS.mean.X",
                "Body.Linear.Acceleration.FDS.mean.Y",
                "Body.Linear.Acceleration.FDS.mean.Z",
                "Body.Linear.Acceleration.FDS.stddev.X",
                "Body.Linear.Acceleration.FDS.stddev.Y",
                "Body.Linear.Acceleration.FDS.stddev.Z",
                "Body.Linear.Acceleration.Jerk.FDS.mean.X",
                "Body.Linear.Acceleration.Jerk.FDS.mean.Y",
                "Body.Linear.Acceleration.Jerk.FDS.mean.Z",
                "Body.Linear.Acceleration.Jerk.FDS.stddev.X",
                "Body.Linear.Acceleration.Jerk.FDS.stddev.Y",
                "Body.Linear.Acceleration.Jerk.FDS.stddev.Z",
                "Body.Gryoscopic.FDS.mean.X",
                "Body.Gryoscopic.FDS.mean.Y",
                "Body.Gryoscopic.FDS.mean.Z",
                "Body.Gryoscopic.FDS.stddev.X",
                "Body.Gryoscopic.FDS.stddev.Y",
                "Body.Gryoscopic.FDS.stddev.Z",
                "Body.Linear.Acceleration.Magnitude.FDS.mean",
                "Body.Linear.Acceleration.Magnitude.FDS.stddev",
                "Body.Linear.Acceleration.Jerk.Magnitude.FDS.mean",
                "Body.Linear.Acceleration.Jerk.Magnitude.FDS.stddev",
                "Body.Gryoscopic.Magnitude.FDS.mean",
                "Body.Gryoscopic.Magnitude.FDS.stddev",
                "Body.Gryoscopic.Jerk.Magnitude.FDS.mean",
                "Body.Gryoscopic.Jerk.Magnitude.FDS.stddev",
                "Source.File")
    #
    setnames(HARdata, colnames)
    #names(HARdata)
    
    #join activity label to new table on y-table value (ie, activity #)
    setnames(act_label, c("Activity.Id", "Activity.Name"))
    HARdata <- merge(act_label, HARdata, by.x="Activity.Id", 
                     by.y="Activity.Id", all=TRUE)
    #names(HARdata)
    #dim(HARdata)
    
    #Creates another data set from HARdata containing the average of
    #each variable for each activity and each subject.
    temp <- group_by(HARdata, Subject.Id, Activity.Name)
    HARavg <- summarize(temp, 
      Body.Linear.Acceleration.TDS.mean.X = mean(Body.Linear.Acceleration.TDS.mean.X),
      Body.Linear.Acceleration.TDS.mean.Y = mean(Body.Linear.Acceleration.TDS.mean.Y),
      Body.Linear.Acceleration.TDS.mean.Z = mean(Body.Linear.Acceleration.TDS.mean.Z),
      Body.Linear.Acceleration.TDS.stddev.X = mean(Body.Linear.Acceleration.TDS.stddev.X),
      Body.Linear.Acceleration.TDS.stddev.Y = mean(Body.Linear.Acceleration.TDS.stddev.Y),
      Body.Linear.Acceleration.TDS.stddev.Z = mean(Body.Linear.Acceleration.TDS.stddev.Z),
      Gravity.Linear.Acceleration.TDS.mean.X = mean(Gravity.Linear.Acceleration.TDS.mean.X),
      Gravity.Linear.Acceleration.TDS.mean.Y = mean(Gravity.Linear.Acceleration.TDS.mean.Y),
      Gravity.Linear.Acceleration.TDS.mean.Z = mean(Gravity.Linear.Acceleration.TDS.mean.Z),
      Gravity.Linear.Acceleration.TDS.stddev.X = mean(Gravity.Linear.Acceleration.TDS.stddev.X),
      Gravity.Linear.Acceleration.TDS.stddev.Y = mean(Gravity.Linear.Acceleration.TDS.stddev.Y),
      Gravity.Linear.Acceleration.TDS.stddev.Z = mean(Gravity.Linear.Acceleration.TDS.stddev.Z),
      Body.Linear.Acceleration.Jerk.TDS.mean.X = mean(Body.Linear.Acceleration.Jerk.TDS.mean.X),
      Body.Linear.Acceleration.Jerk.TDS.mean.Y = mean(Body.Linear.Acceleration.Jerk.TDS.mean.Y),
      Body.Linear.Acceleration.Jerk.TDS.mean.Z = mean(Body.Linear.Acceleration.Jerk.TDS.mean.Z),
      Body.Linear.Acceleration.Jerk.TDS.stddev.X = mean(Body.Linear.Acceleration.Jerk.TDS.stddev.X),
      Body.Linear.Acceleration.Jerk.TDS.stddev.Y = mean(Body.Linear.Acceleration.Jerk.TDS.stddev.Y),
      Body.Linear.Acceleration.Jerk.TDS.stddev.Z = mean(Body.Linear.Acceleration.Jerk.TDS.stddev.Z),
      Body.Gryoscopic.TDS.mean.X = mean(Body.Gryoscopic.TDS.mean.X),
      Body.Gryoscopic.TDS.mean.Y = mean(Body.Gryoscopic.TDS.mean.Y),
      Body.Gryoscopic.TDS.mean.Z = mean(Body.Gryoscopic.TDS.mean.Z),
      Body.Gryoscopic.TDS.stddev.X = mean(Body.Gryoscopic.TDS.stddev.X),
      Body.Gryoscopic.TDS.stddev.Y = mean(Body.Gryoscopic.TDS.stddev.Y),
      Body.Gryoscopic.TDS.stddev.Z = mean(Body.Gryoscopic.TDS.stddev.Z),
      Body.Gryoscopic.Jerk.TDS.mean.X = mean(Body.Gryoscopic.Jerk.TDS.mean.X),
      Body.Gryoscopic.Jerk.TDS.mean.Y = mean(Body.Gryoscopic.Jerk.TDS.mean.Y),
      Body.Gryoscopic.Jerk.TDS.mean.Z = mean(Body.Gryoscopic.Jerk.TDS.mean.Z),
      Body.Gryoscopic.Jerk.TDS.stddev.X = mean(Body.Gryoscopic.Jerk.TDS.stddev.X),
      Body.Gryoscopic.Jerk.TDS.stddev.Y = mean(Body.Gryoscopic.Jerk.TDS.stddev.Y),
      Body.Gryoscopic.Jerk.TDS.stddev.Z = mean(Body.Gryoscopic.Jerk.TDS.stddev.Z),
      Body.Linear.Acceleration.Magnitude.TDS.mean = mean(Body.Linear.Acceleration.Magnitude.TDS.mean),
      Body.Linear.Acceleration.Magnitude.TDS.stddev = mean(Body.Linear.Acceleration.Magnitude.TDS.stddev),
      Gravity.Linear.Acceleration.Magnitude.TDS.mean = mean(Gravity.Linear.Acceleration.Magnitude.TDS.mean),
      Gravity.Linear.Acceleration.Magnitude.TDS.stddev = mean(Gravity.Linear.Acceleration.Magnitude.TDS.stddev),
      Body.Linear.Acceleration.Jerk.Magnitude.TDS.mean = mean(Body.Linear.Acceleration.Jerk.Magnitude.TDS.mean),
      Body.Linear.Acceleration.Jerk.Magnitude.TDS.stddev = mean(Body.Linear.Acceleration.Jerk.Magnitude.TDS.stddev),
      Body.Gryoscopic.Magnitude.TDS.mean = mean(Body.Gryoscopic.Magnitude.TDS.mean),
      Body.Gryoscopic.Magnitude.TDS.stddev = mean(Body.Gryoscopic.Magnitude.TDS.stddev),
      Body.Gryoscopic.Jerk.Magnitude.TDS.mean = mean(Body.Gryoscopic.Jerk.Magnitude.TDS.mean),
      Body.Gryoscopic.Jerk.Magnitude.TDS.stddev = mean(Body.Gryoscopic.Jerk.Magnitude.TDS.stddev),
      Body.Linear.Acceleration.FDS.mean.X = mean(Body.Linear.Acceleration.FDS.mean.X),
      Body.Linear.Acceleration.FDS.mean.Y = mean(Body.Linear.Acceleration.FDS.mean.Y),
      Body.Linear.Acceleration.FDS.mean.Z = mean(Body.Linear.Acceleration.FDS.mean.Z),
      Body.Linear.Acceleration.FDS.stddev.X = mean(Body.Linear.Acceleration.FDS.stddev.X),
      Body.Linear.Acceleration.FDS.stddev.Y = mean(Body.Linear.Acceleration.FDS.stddev.Y),
      Body.Linear.Acceleration.FDS.stddev.Z = mean(Body.Linear.Acceleration.FDS.stddev.Z),
      Body.Linear.Acceleration.Jerk.FDS.mean.X = mean(Body.Linear.Acceleration.Jerk.FDS.mean.X),
      Body.Linear.Acceleration.Jerk.FDS.mean.Y = mean(Body.Linear.Acceleration.Jerk.FDS.mean.Y),
      Body.Linear.Acceleration.Jerk.FDS.mean.Z = mean(Body.Linear.Acceleration.Jerk.FDS.mean.Z),
      Body.Linear.Acceleration.Jerk.FDS.stddev.X = mean(Body.Linear.Acceleration.Jerk.FDS.stddev.X),
      Body.Linear.Acceleration.Jerk.FDS.stddev.Y = mean(Body.Linear.Acceleration.Jerk.FDS.stddev.Y),
      Body.Linear.Acceleration.Jerk.FDS.stddev.Z = mean(Body.Linear.Acceleration.Jerk.FDS.stddev.Z),
      Body.Gryoscopic.FDS.mean.X = mean(Body.Gryoscopic.FDS.mean.X),
      Body.Gryoscopic.FDS.mean.Y = mean(Body.Gryoscopic.FDS.mean.Y),
      Body.Gryoscopic.FDS.mean.Z = mean(Body.Gryoscopic.FDS.mean.Z),
      Body.Gryoscopic.FDS.stddev.X = mean(Body.Gryoscopic.FDS.stddev.X),
      Body.Gryoscopic.FDS.stddev.Y = mean(Body.Gryoscopic.FDS.stddev.Y),
      Body.Gryoscopic.FDS.stddev.Z = mean(Body.Gryoscopic.FDS.stddev.Z),
      Body.Linear.Acceleration.Magnitude.FDS.mean = mean(Body.Linear.Acceleration.Magnitude.FDS.mean),
      Body.Linear.Acceleration.Magnitude.FDS.stddev = mean(Body.Linear.Acceleration.Magnitude.FDS.stddev),
      Body.Linear.Acceleration.Jerk.Magnitude.FDS.mean = mean(Body.Linear.Acceleration.Jerk.Magnitude.FDS.mean),
      Body.Linear.Acceleration.Jerk.Magnitude.FDS.stddev = mean(Body.Linear.Acceleration.Jerk.Magnitude.FDS.stddev),
      Body.Gryoscopic.Magnitude.FDS.mean = mean(Body.Gryoscopic.Magnitude.FDS.mean),
      Body.Gryoscopic.Magnitude.FDS.stddev = mean(Body.Gryoscopic.Magnitude.FDS.stddev),
      Body.Gryoscopic.Jerk.Magnitude.FDS.mean = mean(Body.Gryoscopic.Jerk.Magnitude.FDS.mean),
      Body.Gryoscopic.Jerk.Magnitude.FDS.stddev = mean(Body.Gryoscopic.Jerk.Magnitude.FDS.stddev)
      )
    dim(HARavg)
    
    #Write final data to text file as required for this study (course)
    write.table(HARavg, file="HARavg.txt", row.name=FALSE)

    #Also write to standard csv format file for use with Excel
    write.csv(HARavg, file="HARavg.csv")
}
