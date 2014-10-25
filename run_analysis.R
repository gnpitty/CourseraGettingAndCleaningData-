 
setwd("./Dataset")
#Read data files
trainDat  <- read.table("train/X_train.txt") 
trainLab  <- read.table("train/Y_train.txt") 
trainSub  <- read.table("train/subject_train.txt") 

testDat   <- read.table("test/X_test.txt")
testLab   <- read.table("test/y_test.txt") 
testSub   <- read.table("test/subject_test.txt") 


 
#Read Features
features   <- read.table("features.txt") 

#Select only mean and std from features
 
selcols<- grep(".*mean.*|.*std.*", features[,2])
featLabels <- features[selcols,2]
featLabels <- gsub('[-()]', '', featLabels)

trainDat2 <- trainDat[,selcols]
testDat2  <- testDat[,selcols]

# Set features as labels 
colnames(trainDat2) <- featLabels
colnames(testDat2)  <- featLabels

trainDat3 <- cbind(trainSub, trainLab, trainDat2)
testDat3  <- cbind(testSub, testLab, testDat2)


#Merge Training and Test Data
data <- rbind(trainDat3, testDat3)
 
# Add new labels to subject and label column
colNames <- colnames(data)  
colNames[1]<- "subject"
colNames[2]<- "activity"
colnames(data) <-colNames

#Change activity code for activity label value
activityLabels        = read.csv("activity_labels.txt", sep="", header=FALSE)
activityLabels$V2     = factor(x=activityLabels$V2, levels=activityLabels$V2)

  activityLabelsValues  <-activityLabels$V2[data[,2]]
  data[,2]             = activityLabelsValues
  
  #Write to Tidy file.
write.table(data, "data.txt", sep="\t",row.name=FALSE)
tidy <- aggregate(data, by=list(activity=data$activity, subject=data$subject), FUN=mean)

 write.table(tidy, "tidy.txt", sep="\t",row.name=FALSE)

