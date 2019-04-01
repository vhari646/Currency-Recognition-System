# Currency-Recognition-System
Image Processing System for Identifying Swedish Krona Currency notes using Matlab

1. We created a database for the system to store the characteristics of different currencies. 

2. When the system is given an image, the recognition process starts and the system follows a set of techniques to extract

3. specific characteristic of the image and tries to match the obtained characteristics with the characteristics stored in the database.

4. The system can implement by following the instructions which are described below:

a. Main.m is the primary file of the system, which calls on all the other functions to perform their designated tasks.

b. Cropping.m is the cropping function which is used under the image Pre-Processing technique. After it has completed the cropping process, it returns the image for the next operation.

c. Color.m is used to check the colour of the image and its main function is to return the primary colour of the image for cross checking with the database.

d. The edgehist.m is used for calculating the histogram of the edge as a feature matrix.

e. With totalfeature.m, we normalize and combine the color feature and edgehist in one matrix, using dist command to find the differential with the database

f. With pattern.m we finally perform pattern matching to make sure it matches the correct image with the database.

