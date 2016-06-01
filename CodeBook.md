# Getting-and-Cleaning-Data---Course-Project
This project aims to write an R script (run_analysis.R) that gathers data sets and provides a tidy data

The first part of this script allows optionnally to gather test and train Inertial Signals

The data sets x, y  and subject are created by combining data from train and test (using rbind, first the test data then the train data)

x columns are renamed using the data read in the file "features.txt" ( second column)

The variable goodcolumns allows to retrieve which column name contains either the string "mean()" or the string "std()"
the dataset x is subsetted on these goodcolumns
the activity number is replace by the activity name ( WALKING, STANDING...)

A mergeddata is created by binding the data  contained in  subject, x and y

Groups of subject and activity are created in mergedgroup

The final tidy data summarises the mergedgroup using the dplyr summarise_each with the function mean() and is saved as a csv file into tidydata.csv
