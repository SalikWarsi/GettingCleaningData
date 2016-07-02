library(reshape2)

#Reading test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(subject_test,y_test,x_test)

#Reading train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(subject_train,y_train,x_train)

#Combine the 2 data set
all <- rbind(test,train)

#Reading the features
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features[,2] <- gsub("[()-]","",features[,2])
features[,2] <- tolower(features[,2])

#Filter the features
Wanted <- grep("mean|std",features[,2])
all <- all[,c(1,2,Wanted+2)]

#Assign names to the columns
names(all) <- c("subject", "activity", features[Wanted,2])

#Reading the activities and assigning to the data
activities <- 
  read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)

#Converting Activities to factor
all$activity <- 
  factor(all$activity, levels = activities[,1], labels = activities[,2])

#Melt and cast to get means
melted <- melt(all,id.vars = c("subject", "activity"))
casted <- dcast(melted,subject+activity~variable, mean)

#Writing the table
write.table(casted,"Cleaned.txt", row.names = FALSE)