#training data

training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)



#testing data

testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)


#activity labels
activitylabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

#features
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#Testing and training datasets merge

df = rbind(training, testing)

#mean, st. deviation columns selection

cols = grep(".*Mean.*|.*Std.*", features[,2])


#reducing dataframe

features = features[cols,]

# adding columns: 562 - subject, 563 - activity

cols = c(cols, 562, 563)

#subsetting df

df = df[,cols]

#naming columns

colnames(df) = c(features$V2, "Activity", "Subject")
colnames(df) = tolower(colnames(df))



currentactivity = 1
for (currentactivitylabel in activitylabels$V2) {
        df$activity <- gsub(currentactivity, currentactivitylabel, df$activity)
        currentactivity <- currentactivity + 1
}

df$activity <- as.factor(df$activity)
df$subject <- as.factor(df$subject)

tidy_data = aggregate(df, by=list(activity = df$activity, subject=df$subject), mean)

# Removing the subject and activity column
tidy_data[,90] = NULL
tidy_data[,89] = NULL

# Writing tidy_data
write.table(tidy_data, "tidy_data.txt", sep="\t", row.names=FALSE)
