Get and Clean Data - Course Project
=========================

This folder is for the course project for the Johns Hopkins Getting and Cleaning Data course.

### Overview
This project is based on data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The purpose of this project is to practice how to get and clean data, and as so we have to generate a tidy data set which summarizes information acquired from a movement sensor, used by 30 people under different activities.

.
### Project Instructions

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive activity names.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.

This is the environment in which it was prepared:

```R
> version
               _                           
platform       i686-pc-linux-gnu           
arch           i686                        
os             linux-gnu                   
system         i686, linux-gnu             
status                                     
major          3                           
minor          0.2                         
year           2013                        
month          09                          
day            25                          
svn rev        63987                       
language       R                           
version.string R version 3.0.2 (2013-09-25)
nickname       Frisbee Sailing   
```

###  Running

in order to run the script, you should import the run_analysis.R  file  with the source() command.
Then, you should call the run_analysis() function, which will return the tidy dataset.

To create the output file (optional) you can use the write.table() function.

*  Assumes the dataset is unzipped in the current directory.
