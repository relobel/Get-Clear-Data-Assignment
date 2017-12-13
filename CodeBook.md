## CODEBOOK - Variables used for the Getting and Clearing Data Assignment

The input data come from the following "txt" files, located in the working directory: x\_test, x\_train, y\_test, y\_train, subject\_test, subject\_train, activity\_labels and features.

The input data files have 563 variables (including the subject and activity), but only 83 variables were of interest for this assignment (subject, activity, means variables and standard deviation variables).

The transformation of the variable names were done in 3 steps:

	a) Fixing the features titles to allow them to become the variable names:
		titles <- make.names(titles, unique = TRUE, allow_ = TRUE)

	b) Filtering the required variables by grepping them with the following command: 
		df <- df_all[(grepl("mean",titles) | grepl("std",titles))]
	
	c) Transforming the mean and standard deviation variables to more descriptive names by the use of gsub:
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


Of the resulting 83 variables, the subject variable is integer, the activity is character and all the other data variables are numeric.

The variables are described as follows: 

	VARIABLES: DESCRIPTION
	subject: Unique participant Identification (1:30)
	activity:Activity Descrition (walking, walking_up, walking_down, sit, stand, laying)
	Time_Body_Acc_mean_X: Time domain Body Accelerometer mean X axis
	Time_Body_Acc_mean_Y: Time domain Body Accelerometer mean Y axis
	Time_Body_Acc_mean_Z: Time domain Body Accelerometer mean Z axis
	Time_Body_Acc_std_X: Time domain Body Accelerometer standard deviation X axis
	Time_Body_Acc_std_X: Time domain Body Accelerometer standard deviation Y axis
	Time_Body_Acc_std_Z: Time domain Body Accelerometer standard deviation Z axis
	Time_Gravity_Acc_mean_X: Time domain Gravity Accelerometer mean X axis
	Time_Gravity_Acc_mean_Y: Time domain Gravity Accelerometer mean Y axis
	Time_Gravity_Acc_mean_Z: Time domain Gravity Accelerometer mean Z axis
	Time_Gravity_Acc_std_X: Time domain Gravity Accelerometer standard deviation X axis
	Time_Gravity_Acc_std_Y: Time domain Gravity Accelerometer standard deviation Y axis
	Time_Gravity_Acc_std_Z: Time domain Gravity Accelerometer standard deviation Z axis
	Time_Body_Acc_Jerk_mean_X: Time domain Body Accelerometer Jerk Signal mean X axis
	Time_Body_Acc_Jerk_mean_Y: Time domain Body Accelerometer Jerk Signal mean Y axis
	Time_Body_Acc_Jerk_mean_Z: Time domain Body Accelerometer Jerk Signal mean Z axis
	Time_Body_Acc_Jerk_std_X: Time domain Body Accel. Jerk Signal standard deviation X axis 
	Time_Body_Acc_Jerk_std_Y: Time domain Body Accel. Jerk Signal standard deviation Y axis 
	Time_Body_Acc_Jerk_std_Z:Time domain Body Accel. Jerk Signal standard deviation Z axis 
	Time_Body_Gyro_mean_X: Time domain Body Gyroscope mean X axis
	Time_Body_Gyro_mean_Y: Time domain Body Gyroscope mean Y axis
	Time_Body_Gyro_mean_Z: Time domain Body Gyroscope mean Z axis
	Time_Body_Gyro_std_X: Time domain Body Gyroscope standard deviation X axis
	Time_Body_Gyro_std_Y: Time domain Body Gyroscope standard deviation Y axis
	Time_Body_Gyro_std_z: Time domain Body Gyroscope standard deviation Z axis
	Time_Body_Gyro_Jerk_mean_X: Time domain Body Gyroscope Jerk Signal mean X axis
	Time_Body_Gyro_Jerk_mean_Y: Time domain Body Gyroscope Jerk Signal mean Y axis
	Time_Body_Gyro_Jerk_mean_Z: Time domain Body Gyroscope Jerk Signal mean Z axis
	Time_Body_Gyro_Jerk_std_X: Time domain Body Gyroscope Jerk Signal std X axis
	Time_Body_Gyro_Jerk_std_Y: Time domain Body Gyroscope Jerk Signal std Y axis
	Time_Body_Gyro_Jerk_std_Z: Time domain Body Gyroscope Jerk Signal std Z axis
	Time_Body_Acc_Mag_mean: Time domain Body Accelerometer Magnitude mean
	Time_Body_Acc_Mag_std: Time domain Body Accelerometer Magnitude standard deviation	
	Time_Gravity_Acc_Mag_mean: Time domain Gravity Accelerometer Magnitude mean
	Time_Gravity_Acc_Mag_std: Time domain Gravity Accelerometer Magnitude std
	Time_Body_Acc_Jerk_Mag_mean: Time domain Body Accelerometer Jerk Signal Magnitude mean
	Time_Body_Acc_Jerk_Mag_std: Time domain Body Accelerometer Jerk Signal Magnitude std
	Time_Body_Gyro_Mag_mean: Time domain Body Gyroscope Magnitude mean
	Time_Body_Gyro_Mag_std: Time domain Body Gyroscope Magnitude standard deviation
	Time_Body_Gyro_Jerk_Mag_mean: Time domain Body Gyroscope Jerk Signal Magnitude mean
	Time_Body_Gyro_Jerk_Mag_std: Time domain Body Gyroscope Jerk Signal Magnitude std
	Freq_Body_Acc_mean_X: Frequency domain Body Accelerometer mean X axis
	Freq_Body_Acc_mean_Y: Frequency domain Body Accelerometer mean Y axis
	Freq_Body_Acc_mean_Z: Frequency domain Body Accelerometer mean Z axis
	Freq_Body_Acc_std_X: Frequency domain Body Accelerometer standard deviation X axis
	Freq_Body_Acc_std_Y: Frequency domain Body Accelerometer standard deviation Y axis
	Freq_Body_Acc_std_Z: Frequency domain Body Accelerometer standard deviation Z axis
	Freq_Body_Acc_mean_freq_X: Frequency domain Body Accelerometer mean Frequency X axis
	Freq_Body_Acc_mean_freq_Y: Frequency domain Body Accelerometer mean Frequency Y axis
	Freq_Body_Acc_mean_freq_Z: Frequency domain Body Accelerometer mean Frequency Z axis
	Freq_Body_Acc_Jerk_mean_X: Frequency domain Body Accelerometer Jerk Signal mean X axis
	Freq_Body_Acc_Jerk_mean_Y: Frequency domain Body Accelerometer Jerk Signal mean Y axis
	Freq_Body_Acc_Jerk_mean_Z: Frequency domain Body Accelerometer Jerk Signal mean Z axis
	Freq_Body_Acc_Jerk_std_X: Frequency domain Body Accelerometer Jerk Signal std X axis
	Freq_Body_Acc_Jerk_std_Y: Frequency domain Body Accelerometer Jerk Signal std Y axis
	Freq_Body_Acc_Jerk_std_Z: Frequency domain Body Accelerometer Jerk Signal std Z axis
	Freq_Body_Acc_Jerk_mean_freq_X: Frequency domain Body Accel.Jerk Signal mean Frequency X axis
	Freq_Body_Acc_Jerk_mean_freq_Y: Frequency domain Body Accel.Jerk Signal mean Frequency Y axis
	Freq_Body_Acc_Jerk_mean_freq_Z: Frequency domain Body Accel.Jerk Signal mean Frequency Z axis
	Freq_Body_Gyro_mean_X: Frequency domain Body Gyroscope mean X axis
	Freq_Body_Gyro_mean_Y: Frequency domain Body Gyroscope mean Y axis
	Freq_Body_Gyro_mean_Z: Frequency domain Body Gyroscope mean Z axis
	Freq_Body_Gyro_std_X: Frequency domain Body Gyroscope standard deviation X axis
	Freq_Body_Gyro_std_Y: Frequency domain Body Gyroscope standard deviation Y axis
	Freq_Body_Gyro_std_Z: Frequency domain Body Gyroscope standard deviation Z axis
	Freq_Body_Gyro_mean_freq_X: Frequency domain Body Gyroscope mean Frequency X axis
	Freq_Body_Gyro_mean_freq_Y: Frequency domain Body Gyroscope mean Frequency Y axis
	Freq_Body_Gyro_mean_freq_Z: Frequency domain Body Gyroscope mean Frequency Z axis
	Freq_Body_Acc_Mag_mean: Frequency domain Body Accelerometer Magnitude mean
	Freq_Body_Acc_Mag_std: Frequency domain Body Accelerometer Magnitude std
	Freq_Body_Acc_Mag_mean_freq: Frequency domain Body Accelerometer Magnitude mean Frequency
	Freq_Body_Body_Acc_Jerk_Mag_mean: Frequency domain Body Body Accel.Jerk Signal Magnitude mean
	Freq_Body_Body_Acc_Jerk_Mag_std: Frequency domain Body Body Accel. Jerk Signal Magnitude std
	Freq_Body_Body_Acc_Jerk_Mag_mean_freq: Frequency domain Body Body Accel.Jerk Signal Magnit mean freq 
	Freq_Body_Body_Gyro_Mag_mean: Frequency domain Body Body Gyro Magnitude mean
	Freq_Body_Body_Gyro_Mag_std: Frequency domain Body Body Gyro Magnitude std
	Freq_Body_Body_Gyro_Mag_mean_freq: Frequency domain Body Body Gyro Magnitude mean Frequency
	Freq_Body_Body_Gyro_Jerk_Mag_mean: Frequency domain Body Body Gyro Jerk Signal Magnitude mean
	Freq_Body_Body_Gyro_Jerk_Mag_std: Frequency domain Body Body Gyro Jerk Signal Magnitude std
	Freq_Body_Body_Gyro_Jerk_Mag_mean_freq: Frequency domain Body Body Gyro Jerk Signal Magnitude mean freq
