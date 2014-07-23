#Overview
Hi! Welcome to the codebook.

According to the Project, this is what we're supposed to describe here:

_"...variables, the data, and any transformations or work that you performed to clean up the data..."_

Probably best to explain how machine learning works from a data preparation standpoint. Data are separated into features, also known as (independent, sometimes) variables, and outcomes, also known as labels, also known as (dependent) variables, depending upon your context. 

Each subject, a list of identities of which can be found in the subject_train.txt and subject_test.txt files within their respective directories for train and test, did a bunch of activities, which were listed in the activities_labels.txt file. This activity served as the outcome of interest. Thus, the y_train and y_test files listed an integer for each run, and these integers referred to the associated acitivty from the activities_labels file.

The same set of features were used for both the test and train sets. 

#Variables

Variables were taken from the UCI repository. The Features_Info file in the directory "Explanations from UCI" offers a nice overview, offering more depth than the ReadMe from their. Codes, ranging from 1 to three characters, were used to define and describe each measurement.

The raw signals for the accelerometer-measured movements were coded using "Acc", while those from the gyroscope were measured using "Gyro". The X, Y and Z codes refer to the X,Y and Z axes that were measured. Body and Gravity labels reflect the use of a Butterworth filter. A t prefix denotes that the signals were time-domain. The use of the Jerk label indicates linear acceleration and angular velicty derivations. The vector-magnitude of these movements were calculated using a Euclidean norm, which was indicated with a Mag label. For some of these variables, they were also measured with respect to a FFT rather than time-domain, and so have an f prefix rather than a t prefix. Finally, many of these measures were summarized using a range of statistical descriptors; we focused on mean and standard deviation (std) here.

#Code Walkthrough

Rather than working on this in order, we took a different route as noted in the comments of the code. 

We started with the Train set, where we imported everying necessary from UCI.

Subjects, activity labels, and feature labels were pulled. 

The X-train variables were pulled next, and were labelled wifrom the featurelabels as part of Step3.

From the X_train variables, we selected only those measurements related to mean and std dev using a grep function, as specified in Step2.

Next, the Outcomes of Activities were imported and labelled, as per Step4.

We then cbinded all of this together to create a complete Training set. We than added a variable to indicate that all of these obs belonged to the Training set.

All of the above steps were replicated using the Test data. Note that we used identical column names for subject, outcome, and everything else which enabled us to rbind the Train and Test sets together. 

We then looked at mean measurements for all variables using the aggregate function, with stratification by the analysis stage (train/text), activity level, and subject ID. We cleaned this up by dropping some redundant variables. 

Then we wrote out the file as a .csv for easier interpretation in other programs as needed. Like Python. 







