train<-read.table("train/X_train.txt") #reading train data
test<-read.table("test/X_test.txt") #reading test data
sub_train<-read.table("train/subject_train.txt") #reading subject data
sub_test<-read.table("test/subject_test.txt")
activity_test<-read.table("test/y_test.txt") #reading activity data
activity_train<-read.table("train/y_train.txt")
train<-cbind(activity_train,train) #adding activity data into existing measurements
test<-cbind(activity_test,test)su
train<-cbind(sub_train,train) #adding subject data into existing measurements
test<-cbind(sub_test,test)
data<-rbind(train,test) #merging test and train data
fea<-read.table("features.txt") 
names<-as.character(fea[,2])
colnames(data)<-c("subject","activity",names) #adding column names
data1<-data[,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530)]
#extracting mean and standard deviation data
library(dplyr)
grouped <- data1 %>% group_by(subject,activity)
data2<-grouped %>% summarise_each(funs(mean)) #summarize the mean of each variable for each subject and each activity
activity<-replace(data2$activity,1:180,c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying"))
#replacing activity numbers with descriptive activity names
final<-cbind(data2[,1],activity,data2[,-c(1,2)])
#combining the new activity column with the rest of the data
write.table(final,file="submission.txt",row.names=FALSE)
