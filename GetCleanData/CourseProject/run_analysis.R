# this file contain function to analyze the data set from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# Here are the tasks which are implemented through the run_analysis() function:
#  1 - Merges the training and the test sets to create one data set.
#  2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3 - Uses descriptive activity names to name the activities in the data set
#  4 - Appropriately labels the data set with descriptive variable names. 
#  5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



# This function will load all data from test and train folders.
# After that it concatenates files from both folders into the
# same data frame, by adding rows. Once ready, it mixes the 3 files
# into the same data.frame by adding new collumns.
#
# returns a list with concatenated version of all files.

load_and_concatenate<-function(){
        #loads data from test folder
        test<-list()
        test$subject<-read.table("test/subject_test.txt")       
        test$X<-read.table("test/X_test.txt")
        test$Y<-read.table("test/y_test.txt")
        
        #loads data from train folder
        train<-list()
        train$subject<-read.table("train/subject_train.txt")       
        train$X<-read.table("train/X_train.txt")
        train$Y<-read.table("train/y_train.txt")
        
        data<-list()
        
        #concatenates data from both folder, by adding rows
        data$subject<-rbind(test$subject,train$subject)       
        data$X<-rbind(test$X,train$X)
        data$Y<-rbind(test$Y,train$Y)
        
        #merges the three files into one, by adding columns
        cbind(data$subject,data$Y,data$X)     
}


# this function parses the features.txt file and
# gets the col index from the field in which we are interested (mean and std).
# It returns both the indexes and the col names as a list.
get_mean_std_index<-function(){
        # loads the file which contains all variables' name
        features<-read.table("features.txt",stringsAsFactors=FALSE)      
        
        # greps names to get indexes we're interested (std and mean)
        col_index<-grep("mean()",features$V2,fixed=TRUE)
        col_index<-c(col_index,grep("std",features$V2,fixed=TRUE))
        
        # sorts indexes and get its names
        col_index<-sort(col_index)
        col_names<-features[col_index,2]
        
        # adds 2 to all indexes since we have added two new
        # columns at the beginning of the data frame
        col_index<-col_index+2
        col_index<-c(1,2,col_index)
        
        list(index=col_index,names=col_names)
}

# this function gets the labels from activities (which are on different file)
get_activity_labels<-function(data){
        activity_labels<-read.table("activity_labels.txt") 
        activity_labels[data$V1.1,2]
}

# this is main function which uses all other auxiliary functions
run_analysis<-function(){
        
        #load and concatenates all data from train and test folders
        data<-load_and_concatenate()
        
        #gets col indexes and names
        cols<-get_mean_std_index()
        
        #filters only columns in which we`re interested
        data<-data[cols$index]
        
        #creates new column for activity labels
        data$activity<-get_activity_labels(data)
        
        #removes previous activity ids since we now have the labels
        data<-data[-2]
        
        #set column names
        names(data)<-c("Subject",cols$names,"Activity")
        
        #organizes data in a different way - freezes subject and activity columns and varies other varibles
        mt<-melt(data,id=c("Subject","Activity"))
        
        #applies mean function to each group of subject, activity and variable
        result<-ddply(mt,c("Subject","Activity","variable"),summarise,mean=mean(value))
        
        #if we want to write to a file, just uncomment this command
        #write.table(result,"result.txt",row.names=FALSE)
}
