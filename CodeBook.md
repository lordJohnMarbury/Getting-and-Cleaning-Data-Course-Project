##Code Book

This book describes the data that was used in the project as well as the steps to create a tidy dataset.

###Overview

The data is from 30 volunteers who did a six diffrent acivities while wearing a smartphone.  The smartphone captured data around
these activities.

####Explanation of each file

* Features.txt: Names for 561 of the features
* subject_test.txt: Id of all subjects in the X_test.txt and y_test.txt files
* X_test.txt: 2947 mesures of 561 varibles for 9 of the 30 volunteers
* y_test.txt: 2947 integers. 1 integer for row in each X_test.txt.
* X_train.txt: 7532 mesures of 561 varibles for 9 of the 30 volunteers
* y_train.txt: 7532 integers. 1 integer for row in each X_test.txt.
* activity_lables.txt: 6 activities performed. Text explaining y_train.txt and y_test.txt

More information about the files can be found in the README.MD

### Files not used in this project

All files in the Inertial Signals folders were not used. 

###Processing steps

1. Merged all data into one dataset where apropriate column headers where added.
2. Removed all columns that did not have the names std() or mean(). This gave me 66 columns to which I added the subjectID and activities columns.
3. The activities column was converted from an integer to a string via the factor function
4. A tidy dataset was created containing the mean of each feature for each subject and each activity.






