# Getting-and-Cleaning-Data
## Project assignment
You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
## Key steps:
1. Download zip-file through the link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unpack in root folder in order to work with "UCI HAR Dataset"
2. Make sure run_analysis.R is in the root directory too, if it is not your working directory, use setwd()
3. Run the code in Rstudio and make sure tidy_data.txt file appears in the root directory