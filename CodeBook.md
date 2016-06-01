# Getting-and-Cleaning-Data---Course-Project
This project aims to write an R code that gathers data sets and provides a tidy data

The first part of this script allows optionnally to gather test and train Inertial Signals

The data sets x, y  and subject are created by combining data from train and test (using rbind)

x columns are renamed using the data read in the file "features.txt" ( second column)

the variable goodcolumns allows to retrieve which column name contains either the string "mean()" or the string "std()"
the dataset x is subsetted on these goodcolumns
the activity number is replace by the activity name

a mergeddata is created by binding the data  contained in  subject, x and y
groups of subject and activity are created in mergedgroup

the final tidydata sumamrises the mergedgroup using the dplyr summarise_each with the function mean()
