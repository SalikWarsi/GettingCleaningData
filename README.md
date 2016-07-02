## GettingCleaningData

This contains the code and the data for Coursera Data Science Cource "Getting and Cleaning Data"

#Raw Data
PreRequisite: Raw data should be downloaded and unzipped in a folder:UCI HAR Dataset

#Steps
Run the script run_analysis.R

The script does the following things:
* Reads both test and train data and combines them
* Labels the activities from the file:\UCI HAR Dataset\activity_labels.txt
* Names the columns using \UCI HAR Dataset\features.txt
* Selects only the columns that are means ad standard variations by choosing columns with Mean and Std in their name
* finds the average mean for all the ftures for each subject and activity
* Writes the table : Cleaned.txt
