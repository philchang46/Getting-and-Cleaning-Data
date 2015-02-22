## This R script does the following:

## 1. Merges the training and the test sets to create one data set.

trainData <- read.table("train/X_train.txt")
testData <- read.table("test/X_test.txt")
X <- rbind(trainData, testData)

trainData <- read.table("train/subject_train.txt")
testData <- read.table("test/subject_test.txt")
S <- rbind(trainData, testData)

trainData <- read.table("train/y_train.txt")
testData <- read.table("test/y_test.txt")
Y <- rbind(trainData, testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

featureData <- read.table("features.txt")
indices_of_good_feature <- grep("-mean\\(\\)|-std\\(\\)", featureData[, 2])
X <- X[, indices_of_good_feature]
names(X) <- featureData[indices_of_good_feature, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activityData <- read.table("activity_labels.txt")
activityData[, 2] = gsub("_", "", tolower(as.character(activityData[, 2])))
Y[,1] = activityData[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
cleanDone <- cbind(S, Y, X)
write.table(cleanDone, "merged_clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activityData[,1])
numCols = dim(cleanDone)[2]
result = cleanDone[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
        for (a in 1:numActivities) {
                result[row, 1] = uniqueSubjects[s]
                result[row, 2] = activityData[a, 2]
                tmp <- cleanDone[cleaned$subject==s & cleaned$activity==activityData[a, 2], ]
                result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
                row = row+1
        }
}

write.table(result, "data_set_with_the_averages.txt")