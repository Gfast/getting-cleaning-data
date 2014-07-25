###The created data and its data source

The data set comes from the sourcehttp://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
by merging its training and test sets, extracting only the measurements on the mean and standard deviation for each measurement,
and creating this tidy data set with the average of each variable for each activity and each subject based on merged data set.


###Data variables

1 features or variables selection

The original experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smart phone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz are captured. The experiments 
have been video-recorded to label the data manually. The obtained data set has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). T
he sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only 
low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain. 

Thee signals were used to estimate variables of the feature vector for each pattern:  
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

The set of variables in the created data set were estimated from these signals are:

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

In our created data sets are above variables will use lower case. "-" and "() are altos removed.
for example, "tBodyAcc-mean()-X" will be now as "tbodyaccmeanx"

2 Activity and Subject

Two 1st and 2nd columns are listed activities and different volunteers.

"activity" lists six activities for each volunteer. These activities are:

1) WALKING
2) WALKING_UPSTAIRS
3) WALKING_DOWNSTAIRS
4) SITTING
5) STANDING
6) LAYING

same as variables, only lower case of representation of these activities are used in the data set.

"subject" lists different volunteers, total 30

3 values

the values in the data set are the average of each variable for each activity and each subject 
from origin raw data sets. 



 

