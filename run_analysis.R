library(plyr)
# First step
# Merge the training and test sets to create one data set
##############################################################################
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train_data <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test_data <- read.table("test/subject_test.txt")
# create 'x' data set
subject_x_data <- rbind(x_train, x_test)
# create 'y' data set
subject_y_data <- rbind(y_train, y_test)
# create 'merged_data' data set
subject_data <- rbind(subject_train_data,subject_test_data)
# Second step
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################
measurement_features <- read.table("features.txt")
# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", measurement_features[, 2])
# subset the desired columns
subject_x_data <-subject_x_data[, mean_and_std_features]
# correct the column names
names(x_data) <- measurement_features[mean_and_std_features, 2]
# Third Step
# Use descriptive activity names to name the activities in the data set
###############################################################################
descriptive_activities <- read.table("activity_labels.txt")
# update values with correct activity names
subject_y_data[, 1] <- descriptive_activities[subject_y_data[, 1], 2]
# correct column name
names(subject_y_data) <- "activity"
# Fourth Step
# Appropriately label the data set with descriptive variable names
###############################################################################
# correct column name
names(subject_data) <- "subject"
# bind all the data in a single data set
all_data <- cbind(subject_x_data,subject_y_data,subject_data)
# Fifth Step
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################
# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)

