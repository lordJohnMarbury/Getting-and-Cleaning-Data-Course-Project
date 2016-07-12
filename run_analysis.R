#testset

library(reshape2)

# step 1: Merges the training and the test sets to create one data set


#dir <-"C:/Users/fredrik.kjellman/Coursera/R/week4/"

# read the datafiles

# subject_train <- read.table(paste0(dir, "train/subject_train.txt"))
# subject_test <- read.table(paste0(dir, "test/subject_test.txt"))
# xTrain <- read.table(paste0(dir, "train/X_train.txt"))
# xTest <- read.table(paste0(dir, "test/X_test.txt"))
# yTrain <- read.table(paste0(dir, "train/y_train.txt"))
# yTest <- read.table(paste0(dir, "test/Y_test.txt"))
# features <- read.table(paste0(dir, "features.txt")) [,2]


subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
xTrain <- read.table("train/X_train.txt")
xTest <- read.table("test/X_test.txt")
yTrain <- read.table("train/y_train.txt")
yTest <- read.table("test/Y_test.txt")
features <- read.table("features.txt") [,2]






# add column name for test and train subject files

names(subject_test) <-"subjectID"
names(subject_train) <-"subjectID"

# add column names to yTest and yTrain

names(yTest) <-"activities"
names(yTrain) <-"activities"


#add colum names to xTest and xTrain

names(xTest)<- features
names(xTrain)<- features



# bind the data

train <- cbind(subject_train, xTrain, yTrain)
test <- cbind(subject_test, xTest, yTest)
combined <-rbind(train, test)

# step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

extract_only_features<-grepl("mean\\(\\)|std\\(\\)", names(combined))

# make sure that the activities and subjectID columns are kept
  
extract_only_features[1]<- TRUE; extract_only_features[563] <-TRUE

combined_stdmean <- combined[, extract_only_features]

# step 3: Uses descriptive activity names to name the activities in the data set
# Step 4: Appropriately labels the data set with descriptive variable names

combined_stdmean$activities <-factor(combined_stdmean$activities, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#for each activity and each subject.

melted <- melt(combined_stdmean, id=c("subjectID","activities"))
tidy <- dcast(melted, subjectID+activities ~ variable, mean)



