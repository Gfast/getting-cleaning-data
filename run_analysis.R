
rm(list=ls())

#=========================================================================================================
#	Merge the training and the tests sets to create one data set
#=========================================================================================================

# read test data set 
X_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
#dim(X_test)				#size 2947x561
#dim(y_test)				#size	2947x1
#dim(subject_test)			#size 2947x1

testData <- cbind(X_test, y_test, subject_test)  	#size 2947x563

# read train data set
X_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
#dim(X_train)			#size 7352x561
#dim(y_train)			#size	7352x1
#dim(subject_train)		#size 7352x1

trainData <- cbind(X_train, y_train, subject_train)	#size 7352x563

# merged data set

mergedData <- rbind(testData, trainData)			#size (2947+7352)x563 = 10299x563

#=========================================================================================================
#	Extracts only the measurements on the mean and standard deviation for each measurement
#=========================================================================================================

# read features
features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
#dim(features)			#561x2

# remove "-" and "()", replace "mean" by "Mean" and "std" by "Std"
features[,2] <- gsub("-mean", "Mean", features[,2])
features[,2] <- gsub("-std", "Std", features[,2])
features[,2] <- gsub("[-()]", "", features[,2])

# extract only the features on the mean and standard deviation 
extractedFeaturesIndex <- grep("Mean|Std", features[,2])
#length(extractedFeaturesIndex)				# 86
extractedFeatures <- features[extractedFeaturesIndex,]

# extracts only the measurements on the mean and standard deviation
extractedMeasurementsIndex <- c(extractedFeaturesIndex, 562, 563)   # need to include y_test/y_train and subject_test/subject_train total 88
extractedData <- mergedData[, extractedMeasurementsIndex]
#dim(extractedData)						#size 10299x88
#names(extractedData)

#=========================================================================================================
#	Uses descriptive activity names to name the activities in the data set
#=========================================================================================================

# read activity labels
activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
#dim(activity_labels)						#size 6x2
activity_labels[,2] <- tolower(activity_labels[,2])

for (i in activity_labels$V1){	
	extractedData$V1.1 <- gsub(i, activity_labels$V2[i], extractedData$V1.1)
}

#=========================================================================================================
#	labels the data set with descriptive variable names
#=========================================================================================================

# apply names to the each column of the extracted data
extractedFeaturename <- tolower(extractedFeatures$V2)
colnames(extractedData) <- c(extractedFeaturename, "activity", "subject")
#names(extractedData) 

# creat the first data
write.table(extractedData, "extractedData.txt", sep = "\t")
#write.csv(extractedData, "extractedData.csv")

#=========================================================================================================
#	Creates a second, independent tidy data set with the average of each variable 
#	for each activity and each subject. 
#=========================================================================================================

# move the subject and activity to the 1st and 2nd columns
tidy_data <- extractedData[, 1:(dim(extractedData)[2]-2)]
tidy_data <- cbind(extractedData$subject, extractedData$activity, tidy_data)
names(tidy_data)[1] <- "subject"
names(tidy_data)[2] <- "activity"

# remove rows more than length(table(extractedData$subject)) x length(table(extractedData$activity) =180
# to get pre-tidy data frame

tidy_data <- tidy_data[1:(length(table(extractedData$subject))*length(table(extractedData$activity))),]

for (i in 1:length(table(extractedData$subject))){
	for (j in 1:length(table(extractedData$activity))){
		tidy_data[(i-1)*length(table(extractedData$activity))+j,1] <- i
		tidy_data[(i-1)*length(table(extractedData$activity))+j,2] <- tolower(activity_labels[,2])[j]
		temp_index <- (i == extractedData$subject)&(activity_labels$V2[j] == extractedData$activity)	
            tidy_data[(i-1)*length(table(extractedData$activity))+j,3:dim(tidy_data)[2]] <- colMeans(extractedData[temp_index, 1:(dim(tidy_data)[2]-2)]) 
	}

}

write.table(tidy_data, "tidy_data.txt", sep = "\t")
#write.csv(tidy_data, "tidy_data.csv")
#write.table(format(tidy_data, digits = 4), "tidy_data_temp.txt", sep = "\t")





