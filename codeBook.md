**Introduction**

The script run_analysis.R performs the five steps described in the course project.

-All similar data is merged using the rbind() function and address those files with the same number of columns and referring to the same entities.

-Only those columns with the mean and standard deviation measures are taken from the whole dataset. After taking the columns, they will be given the correct names from measurment_features.txt.

-As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

-On the whole dataset, those columns with vague column names would be corrected.

-Last but not least, we generate a new dataset with all the average measures for each subject and activity type 

(30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

**Variables**

-x_train,y_train,x_test,y_test, subject_train_data and subject_test_data contain the data from the downloaded files.

-subject_x_data,subject_y_data and subject_data merge the previous datasets to further analysis.

-Measurment_features contains the correct names for the subject_x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

-A similar approach is taken with activity names through the activities variable.

-All_data merges subject_x_data,subject_y_data and subject_data in a big dataset.

-averages_data contains the relevant averages which will be later stored in a second tidy file.












