#Read in all the data 
features <- read.table('./features.txt',header=FALSE); 
activityType <- read.table('./activity_labels.txt', header=FALSE); 
x_train <- read.table("train/X_train.txt", header=FALSE)
y_train <- read.table("train/y_train.txt", header=FALSE)
subject_train <- read.table("train/subject_train.txt", header=FALSE)
x_test <- read.table("test/X_test.txt", header=FALSE)
y_test <- read.table("test/y_test.txt", header=FALSE)
subject_test <- read.table("test/subject_test.txt", header=FALSE);
#Combine test and train files                           
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
#Assign labeles to columns
colnames(x_data) <- features[,2]
colnames(y_data) <-"activityId"
colnames(subject_data) <- "subjectId"
colnames(activityType) <- c('activityId','activityType')
#Merge data
alldata <- cbind(subject_data , y_data, x_data)

colnames <- colnames(alldata) #Read in column labels for clean up
for (i in 1:length(colnames)) 
{
    colnames[i] = gsub("\\()","",colnames[i]) #remove open & close parenthesi from labels
    colnames[i] = gsub("([Bb]ody[Bb]ody)","Body",colnames[i]) # remove duplicate 'body'
};
colnames(alldata) = colnames; #rename column names
#Extract only the selective columns (Subject, activityID, mean and standard deviation)
mean_stdev <- (grepl("activityId" , colnames) | grepl("subjectId" , colnames) | grepl("mean.." , colnames) | grepl("std.." , colnames))
mean_stdev_data <- alldata[ , mean_stdev == TRUE]
#Add descriptive labeles to activity
mean_stdev_data_final <- merge(mean_stdev_data, activityType, by='activityId', all.x=TRUE)
#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData = ddply(mean_stdev_data_final, c("subjectId","activityId"), numcolwise(mean))
#Add descriptive labels to activity
tidyData_final <-merge(tidyData, activityType, by='activityId', all.x=TRUE)
#Write table to file
write.table(tidyData_final, 'tidyData.txt', row.name=FALSE)
                       