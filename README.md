CleaningDataGit
===============
Hi! Thanks for taking the time to review this project. 

I consolidated all functions into a single script within this repository named run_analysis.R . 

You will notice that the UCI HAR Dataset files are also found in this Git repository, which can also serve as the working directory. 

I did move the README and features.info from the UCI HAR dataset to their own directory to avoid confusion from having 2 README's, and to avoid any CC issues. 

The output of the script is the motiondata.csv file for easy review in Excel. 

Note that, as this is a rather standard machine learning approach to separate data into test and train sets, the final output is also stratified into test and train strata for convenience. This could have been easily adjusted by removing this layer from the aggregate() function. 

Please refer to the Codebook for more information on how to evaluate the results and code. Cheers!
