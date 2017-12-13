# Coursera DataScience - Get-Clear-Data-Build Tidy Data Set 
### Final Assignment - Created by Robert Lobel, December-2017

### Introduction
function run\_analysis(), reads the "UCI HAR Dataset" and converts it, using "dplyr", to a tidy dataset, with means / stds and a summary by activity /subject 

### How to use the function run\_analysis
All the required input data files and the R file "run\_analysis.R" must be located in the working directory. The required "txt" files are:

	x\_test, x\_train, y\_test, y\_train, subject\_test, subject\_train, activity_labels and features

To execute the function is required the following steps:                 
	
	setwd("...")
	source("run_analysis.R")
	df_step1 <- run_analysis()

### run\_analysis() output
The function creates the "summary\_activity\_subject.txt" file in the working directory.  with 180 rows and 81 columns, grouping the average of all means and stds variables by activity and subject.

	"upload the tidy data set created in step 5 of the instructions"
 
The function also displays the View of summary data-frame, the complete tidy data-set, the filtered data-set with only means and stds and the descriptive names of the variables.
As requested by the submission instruction it returns the complete tidy data-set resulting from step 1.
 	
	"The output should be the tidy data set you submitted for part 1."

### Step 0:
Read the input .CSV files and convert them to tbl\_df, to make the data available to "dplyr". First read the "features.txt" to the array "titles", to be used as the data variables names. Next I use the function make.names to fix and remove duplicate names to make the text acceptable as variable names. Next read the 3 "test" and the 3 "train" files (data, subject and activities) and bind them together  and set their variable names.  

	titles <- tbl_df(read.table("features.txt", colClasses = c("character"), stringsAsFactors = FALSE ))
	titles<- c("subject","activity",as.array(titles$V2))
	titles <- make.names(titles, unique = TRUE, allow_ = TRUE)
	x_test<-tbl_df(read.table("X_test.txt",colClasses = c("numeric")))
	x_test<-tbl_df(read.table("X_test.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
	s_test<-tbl_df(read.table("subject_test.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
	t_test<-tbl_df(read.table("y_test.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
	x_test = bind_cols(s_test, t_test, x_test)
	colnames(x_test) = titles
	x_train<-tbl_df(read.table("x_train.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
	s_train<-tbl_df(read.table("subject_train.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
	t_train<-tbl_df(read.table("y_train.txt",colClasses = c("numeric"), stringsAsFactors = FALSE))
	x_train <- bind_cols(s_train, t_train, x_train)
	colnames(x_train) = titles

The step 0 results in 2 data frames "x\_test" and "x\_train", with the following dimensions respectively:

	# "dim x_test/x_train:  2947 563 / 7352 563"

### Step 1: Merges the x\_test and the x\_train sets to create one data set.
Merges with "bind\_rows"the training and test data-sets created in step 0, into a merged data-frame called df\_all.

	df_all <- bind_rows(x_test,x_train)

The step 1 results in the data-frame "df\_all", with the test and training data together, with the following dimension:

	# "dim of the merged dataframe (df_all):  10299 563"

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
Creates a sub-set data-frame "df" with only the activity, subject, means & std_dev data. Use the "grep" function to select only the variables that have mean or std in their name. At the end of this step, updates the "titles" array to contain only the remaining variable names:
	
	titles <- colnames(df_all)
	df <- df_all[(grepl("mean",titles) | grepl("std",titles))]
	df <- bind_cols(df_all[,1:2], df)
	titles <- colnames(df)

In step 2 results in the data-frame "df", with the sub-set of the "means" and "standard deviation" of the test and training data together, reducing the data-frame from 563 to only 81 variables.

	# "dim of df whith only subject, activities,  means and standard deviations: 10299 81"

### Step 3: Uses descriptive activity names to name the activities in the data set.
In step 3, first I create an array "activities" with all activities description, next I replace the variable "activity" for the with the activity description. 

	activities = c("WALK","WALK_UP","WALK_DOWN","SIT","STAND","LAYING")
	df$activity <- activities[df$activity]

### Step 4: Appropriately labels the data set with descriptive variable names. 
In step 4, I do a sequence of "gsub" on the variable names array "titles", to make them more descriptive. At the end of this step, I update the variable names of the data-frame "df" with the updated "titles" array: 	
	
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

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
In step 5, I initially create a grouped data-frame "gr\_act\_subj" using the "group\_by" to group the data-frame "df" by activity and subject. Next I use the function "summarize\_all" to obtain the new aggregated data frame. At the it writes a "txt" file with the content of the summary data-frame to the file "summary_activity_subject.txt" at the same folder of this program

	gr_act_subj <- group_by(df, activity, subject)
	mean_act_subj <- summarise_all(gr_act_subj,"mean")
	write.table(mean_act_subj,"summary_activity_subject.txt",row.name = FALSE)

The aggregated data-frame "gr\_act\_subj" has only 180 aggregated rows instead of the 10,299 rows of the original data-frame:

At the end the program returns the original data-frame "df\_all", as requested by the assessment instruction:

	The output should be the tidy data set you submitted for part 1

### Files in the Repo:
The following files were posted to the Repo:

	a) "run_analysis.R" - The code with the function "run_analysis()"    
	b) "summary_activity_subject.txt" - the resulting file with summarized data by activity / subject
	c) input files: "X_train.txt", "subject_train.txt", "y_train.txt", "X_test.txt",  "subject_test.txt", 
      	"y_test.txt", "activity_labels.txt", "features.txt" and  "features_info.txt"
	d) This "README.md" describing how the script works, as requested by the assessment instruction. 
    e) The codebook: "CodeBook.md", describing the variables, as requested by the assessment instruction. 


