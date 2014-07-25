
This project tries to get and clean the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
A full description is available at the site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The objective of the project is to achieve the following:

Create one R script to perform:

	1.	Merges the training and the test sets to create one data set.
	2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
	3.	Uses descriptive activity names to name the activities in the data set
	4.	Appropriately labels the data set with descriptive variable names. 
	5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The steps are listed as below:

      1.	Save the R script "run_analysis.R" and download data in the same folder.
      2.	Unzip the downloaded data. You will have all data sets in the folder "getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset"
      3.	Open R-Gui and set the working path by using setwd() to the folder where R script "run_analysis.R" is located
      4.	Run command: source("run_analysis.R") in R Console
      5.   	You will get two data sets:  merged data "extractedData.txt" and tidy data "tidy_data.txt"

Only "tidy_data.txt" is loaded in the repo. A code book "CodeBook.md" which explains data and variables of tidy data can be also found in the repo.
For detailed information about the source data, please refer to documents in "getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset".


