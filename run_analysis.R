setwd("/Users/patricktighe/Documents/datasciencecoursera/cleaningdata/CleaningDataGit")
library(plyr)
#Start with Training Data

#import everything

#Start with the Subject
subject_train <- read.table("train/subject_train.txt", col.names=c("subject"))

#Now the activity labels
al <-read.table("activity_labels.txt",col.names=c('activity_label_integer',"activity_label"))

#Now the feature labels
feature_labels <-read.table("features.txt", col.names=c("featureID","featureLabel"))

#Next the Variables, label using feature labels from above; this is for Step4 in the Project
X_train <-read.table("train/X_train.txt")
X_train_labelled <-read.table("train/X_train.txt", col.names=feature_labels$featureLabel)
# X_train_labelled2<-X_train_labelled
# colnames(X_train_labelled2) <-paste("train",colnames(X_train_labelled),sep="_")

###Extract only the measurements on the mean and standard deviation for each measurement, for Step 2 in project
mn<-grep("mean|std",names(X_train_labelled),value=TRUE)
X_train_labelled_reduced<-X_train_labelled[,mn]


#Next the Outcomes, labelled in accordance with Step 4
y_train <-read.table("train/y_train.txt",col.names=c("outcome"))
outcome <-mapvalues(y_train$outcome,from=c("1",'2','3','4','5','6'), to=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

T1<-cbind(subject_train,X_train_labelled_reduced,outcome)
T1$Type = 'Train'



#############################
###########Now Testing Data
#############################

#Start with the Subject
subject_test <- read.table("test/subject_test.txt", col.names=c("subject"))

#Keep activity level labels from above

#Keep the feature level labels from above; this is for Step 3 in the Project

#Next the Variables, label using feature labels from above
X_test <-read.table("test/X_test.txt")
X_test_labelled <-read.table("test/X_test.txt", col.names=feature_labels$featureLabel)

###Extract only the measurements on the mean and standard deviation for each measurement, for Step 2 in project
op<-grep("mean|std",names(X_test_labelled),value=TRUE)
X_test_labelled_reduced<-X_test_labelled[,op]


#Next the Outcomes, labelled in accordance with Step4
y_test <-read.table("test/y_test.txt",col.names=c("outcome"))
outcome <-mapvalues(y_test$outcome,from=c("1",'2','3','4','5','6'), to=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

T2<-cbind(subject_test,X_test_labelled_reduced,outcome)
T2$Type = 'Test'
# 
# 
# colnames(T1)
# colnames(T2)

T<- rbind(T1, T2)
colnames(T)
str(T)
T$subject <-as.factor(T$subject)
T$Type <-as.factor(T$Type)

####Create the tidy dataset with the average of each variable, by subject, by activity
###Hierarchy: Train/Test, Outcome, Subject, Average of Each Measurement

F<-aggregate(T,by=list(AnalysisStage=T$Type,Activity=T$outcome,EnrolledSubject=T$subject),FUN='mean')

F[,'subject']<-NULL
F[,'Type']<-NULL
F[,'outcome']<-NULL

write.table(F,"motiondata.csv",sep=",")
