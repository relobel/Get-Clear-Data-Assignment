# setwd("D:/git_repo/Get-Clear-Data-Assignment")

run_analysis <- function() {
library(dplyr)

#Step 0. Read Raw data into Tables 
print("step 0 loads required files merging subject/activity/data")
print("setp 0 also sets the variable names from 'features.txt'")
print("step 0 results in 2 datafrmaes: x_test and x_train")

#read the feature values from "features.txt" and fix them to use it as initial variable names
titles <- tbl_df(read.table("features.txt", colClasses = c("character"), stringsAsFactors = FALSE ))
titles<- c("subject","activity",as.array(titles$V2))
#fix the invalid varaible names
titles <- make.names(titles, unique = TRUE, allow_ = TRUE)

x_test<-tbl_df(read.table("X_test.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
s_test<-tbl_df(read.table("subject_test.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
t_test<-tbl_df(read.table("y_test.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
x_test <- bind_cols(s_test, t_test, x_test)
colnames(x_test) = titles

x_train<-tbl_df(read.table("x_train.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
s_train<-tbl_df(read.table("subject_train.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
t_train<-tbl_df(read.table("y_train.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
x_train <- bind_cols(s_train, t_train, x_train)
colnames(x_train) = titles
print(paste("dim x_test/x_train: ",dim(x_test)[1],dim(x_test)[2], "/" ,dim(x_train)[1],dim(x_train)[2]))
# "dim x_test/x_train:  2947 563 / 7352 563"

#Step 1: Merges the training and the test sets to create one data set.
print("Step 1 merges x_train and x_test in the df_all dataframe")
df_all <- bind_rows(x_test,x_train)
print(paste("dim of the merged dataframe (df_all): ",dim(df_all)[1],dim(df_all)[2]))
# "dim of the merged dataframe (df_all):  10299 563"

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
print("step 2 creates a subset df dataframe, with subjects/activities/means/stds")
titles <- colnames(df_all)
df <- df_all[(grepl("mean",titles) | grepl("std",titles))]
df <- bind_cols(df_all[,1:2], df)
titles <- colnames(df)
print(paste("dim of df whith only subject/activity/means/stds:",dim(df)[1], dim(df)[2]))
# "dim of df whith only subject, activities,  means and standard deviations: 10299 81"

#Step 3: Uses descriptive activity names to name the activities in the data set
activities = c("WALK","WALK_UP","WALK_DOWN","SIT","STAND","LAYING")
df$activity <- activities[df$activity]
print("Step 3 replaced the activity code 1:6 by the activity name")

#Step 4: Appropriately labels the data set with descriptive variable names. 
#replace with gsub the variable names with more descriptive names
titles = gsub("tBody","Time_Body_",titles,fixed=TRUE)
titles = gsub("fBody","Freq_Body_",titles,fixed=TRUE)
titles = gsub("gravity","Gravity",titles,fixed=TRUE)
titles = gsub("tGravity","Time_Gravity_",titles,fixed=TRUE)
titles = gsub("_Acc_","_Accel_",titles,titles, fixed=TRUE)
titles = gsub("angle","Angle",titles,fixed=TRUE)
titles = gsub("Jerk","_Jerk",titles,fixed=TRUE)
titles = gsub("Mag","_Mag",titles,fixed=TRUE)
titles = gsub("_meanFreq","_mean_Freq",titles,fixed=TRUE)
titles = gsub("Body_Body","Body_Body_",titles,fixed=TRUE)
titles = gsub("angle","Angle",titles,fixed=TRUE)
titles = gsub("Jerk","_Jerk",titles,fixed=TRUE)
titles = gsub("Mag","_Mag",titles,fixed=TRUE)
titles = gsub("_meanFreq","_mean_Freq",titles,fixed=TRUE)
titles = gsub("Body_Body","Body_Body_",titles,fixed=TRUE)
titles = gsub("__","_",titles,fixed=TRUE)
titles = gsub("...","_",titles,fixed=TRUE)
titles = gsub(".","_",titles,fixed=TRUE)
titles = gsub("mean__","mean",titles,fixed=TRUE)
titles = gsub("std__","std",titles,fixed=TRUE)
titles = gsub("meanFreq","mean_freq",titles,fixed=TRUE)
titles = gsub("freq__","freq",titles,fixed=TRUE)
colnames(df) <- titles
print("step 4, gsub replaced variable names to more descriptive names")

#Step 5: From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
print("Step 5, creates file 'summary_activity_subject.txt' with average by activity/subject")
gr_act_subj <- group_by(df, activity, subject)
mean_act_subj <- summarise_all(gr_act_subj,"mean")
write.table(mean_act_subj,"summary_activity_subject.txt",row.name = FALSE)
print(paste("step 5, dim of the summary data-frame mean_act_subj:",
            dim(mean_act_subj)[1], dim(mean_act_subj)[2]))
# "dim of the summary data-frame: 180 81"

# as requested at the submission instructions:
# "The output should be the tidy data set you submitted for part 1."
df_all
}
