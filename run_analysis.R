library(stringr); library(dplyr)
#setwd("I:/Data scientist/3 - Getting and Cleaning Data/W5 - Project/UCI HAR Dataset")
setwd("C:/Users/IP/Documents")

#retrieveing the names of "test" and "train" files for the folder "Inertial Signals",  ( optional)
# testfiles<-list.files(path="~/test/Inertial Signals")
# trainfiles<-list.files(path="~/train/Inertial Signals")

#Gathering Inertial Signals (train and test) into one table for each variable  

# body_acc_x<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[1])),read.table(paste0("~/train/Inertial Signals/", trainfiles[1])))

# body_acc_y<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[2])), read.table(paste0("~/train/Inertial Signals/", trainfiles[2])))

# body_acc_z<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[3])), read.table(paste0("~/train/Inertial Signals/", trainfiles[3])))

# body_gyro_x<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[4])), read.table(paste0("~/train/Inertial Signals/", trainfiles[4])))

# body_gyro_y<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[5])), read.table(paste0("~/train/Inertial Signals/", trainfiles[5])))

# body_gyro_z<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[6])), read.table(paste0("~/train/Inertial Signals/", trainfiles[6])))

# total_acc_x<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[7])), read.table(paste0("~/train/Inertial Signals/", trainfiles[7])))

# total_acc_y<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[8])), read.table(paste0("~/train/Inertial Signals/", trainfiles[8])))

# total_acc_z<-rbind(read.table(paste0("~/test/Inertial Signals/", testfiles[9])), read.table(paste0("~/train/Inertial Signals/", trainfiles[9])))



#read tables x, y and subject for both test and train

x<-rbind(read.table("~/test/X_test.txt"), read.table("~/train/X_train.txt"))

y<-rbind(read.table("~/test/y_test.txt"), read.table("~/train/y_train.txt"))

subject<-rbind(read.table("~/test/subject_test.txt"), read.table("~/train/subject_train.txt"))
colnames(subject)<-"subject"


#read features.txt in order to get the names of the variables
features<-read.table("features.txt")
colnames(x)<-features[,2]

#Extract from x only mean (mean()) and standard deviation (std())
goodcolumns<-union(grep("mean()", colnames(x)), grep("std()", colnames(x)))
goodcolumns<-sort(goodcolumns)
x<-x[, goodcolumns]

#read the table y for activity and replace activity number by its correct name
activity<-read.table("activity_labels.txt")
for (i in 1: nrow(y)) { y[i, 1]<-as.character(activity[y[i, 1],2])}
colnames(y)<-"activity"


#Merge subject, y and x tables
mergeddata<-cbind(subject, y, x)

#create groups of subject , then activity
mergedgroup<-group_by(mergeddata, subject, activity)

#summarizing by each column mean
tidydata<-summarise_each(mergedgroup, funs(mean))

write.csv(tidydata, file="tidydata.csv", row.names=FALSE)
 
