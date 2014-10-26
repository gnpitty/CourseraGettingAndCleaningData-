 Variables and Task of run_analysis,R script
 =============================================
 
 Data loading in R: .<br>
 trainDat  has the content of "train/X_train.txt".<br>
 trainLab  has the content of "train/Y_train.txt"  .<br>
 trainSub  has the content of "train/subject_train.txt") .<br>
 .<br>
 testDat   has the content of "test/X_test.txt").<br>
 testLab   has the content of "test/y_test.txt") .<br>
 testSub   has the content of "test/subject_test.txt") .<br>
 features  has the content of "features.txt") .<br>
 .<br>
 #Select only mean and std from features.<br>
  .<br>
 selcols the columns of standar an Mean data..<br>
 trainDat2 has the information of select columns of training data.<br>
 testDat2  has the information of select columns of test data.<br>
 .<br>
 # Set features as labels .<br>
 .<br>
 .<br>
 trainDat3 has the merge data of trainig data, trainig subject and trainig activities.<br>
 testDat3 has the merge data of test data, test subject and test activities.<br>
 .<br>
 .<br>
 #Merge Training and Test Data.<br>
 data is the merge of trainDat3 (training data)and  testDat3(test Data).<br>
  .<br>
 # Add new labels to subject and label column.<br>
 .<br>
 #Change activity code for activity label value.<br>
 activityLabels   .<br>
 .<br>
 #Write to Tidy file..<br>
 write.table(data, "data.txt", sep="\t",row.name=FALSE)
 
