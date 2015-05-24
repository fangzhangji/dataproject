### Data processing

Data from files "x_test" and "x_train" are merged together into a big data set.

Activity data is added to the data set by reading from "y_test" and "y_train".

Subject data is added to the data set by reading from "subject_test" and "subject_train".

I added column names to the data set by reading from "features".

I selected mean and standard deviation data from the data set (columns that have names containing "mean" or "std").

I grouped the data according to subject and activity, and calculated the mean of each variable.

Then I changed activity numbers into activity names in the data set.

There are explanations in the R script as well.