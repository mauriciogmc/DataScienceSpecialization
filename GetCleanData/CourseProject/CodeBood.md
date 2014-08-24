### Get and Clean Data - Course Project

### About the data which run_analysis() creates

The information is a tidy dataset which is organized in 4 columns:

Subject: the subject in which the measurements were conducted. It ranges from 1 to 30 since 30 people were involded on data acquisition.

Activity: it states which sort of activity was being made by this single subject during measuments. Only 6 possible values.

Variable: it indicates the name of the variable of interest. Only mean and std fields were fields of interest during this project.

Mean: the mean value from all occurences of Variable (from this single Subject, during this single Activity).

I have opted not to change the variable names, since it is already descriptive and I we change, there would need to be a traceability matrix and it would make it difficult to understand the origin of data (by analyzing raw data).

This is the format of the tidy dataset created:

"Subject" "Activity" "variable" "mean"
1 "LAYING" "tBodyAcc-mean()-X" 0.22159824394
1 "LAYING" "tBodyAcc-mean()-Y" -0.0405139534294
1 "LAYING" "tBodyAcc-mean()-Z" -0.11320355358
1 "LAYING" "tBodyAcc-std()-X" -0.9280564692




# This information is about the data in which our analysis was based on. More can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about this dataset.


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



