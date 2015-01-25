
% Clear the console
clc
% clear the memory
clear all

% I create a simple matrix for demonstration.  In the homework you will
% use the input argument "points" 
MA = [1, 2, 3; 8, 9, 0];
MA

% For each column, the sum function sums up all the elements.  The
% same is true for the min and max functions that you need for your
% parameters for normalization and denormalization. 
% If you had matrix with 19 rows and 7 columns your result
% would be a matrix with 1 row and 7 columns.  In my example MA is a
% 2 X 3 matrix.  So the result will be a 1 X 3 matrix.
sumMA = sum(MA);
sumMA
meanMA = mean(MA);
meanMA

% If you want to add or subtract two matrices then you can simply
% use the plus or minus sign.  The two matrices need to have the same
% dimensions and the resulting matrix will have the same dimensions
% too.
% For instance, you can add sumMA with mean(MA):
sumPlusMeanMA = sumMA + meanMA;
sumPlusMeanMA
% In your homework, you can get a row vector that has the range of
% each column by subtracting the min values in each dimension from
% the max max values in each dimension.  The code might look similar to
% the above addition except that you would use a minus sign.

% It is more difficult when you want to add a row vector to every row
% in a matrix.  There are two ways to do this.
% You can use either pattern for the homework.  For the min-max
% normalization You need to subtract
% away the min from every point and centroid.  

% In either of the two ways, you need
% to know how many rows you have.  In the homework, we need to know how
% many rows there are in points.  In other words, we need to know how many
% points there are in points.  
% Rows are the first dimension in MATLAB, just like in matrix algebra and R.
numberOfRows = size(MA, 1); 
% Columns are the second dimension in MATLAB, just like in matrix algebra and R.
numberOfColumns = size(MA, 2); 

% In the first way to add a row to every row in a matrix, you use a loop and get
% one row at a time from the matrix and add it to the row vector.  In this
% example we add the mean of the column to each element in MA:
meanMA = mean(MA);
for rowNumber = 1:numberOfRows
	MAplusMean(rowNumber, :) = MA(rowNumber, :) + meanMA;
end % end the for loop
MAplusMean

% The second way to add a row vector to every row in a matrix is by
% using vectorization.  In MATLAB, vectorization is the preferred
% method.  In vectorization, you will replicate a row until you have
% created a matrix with the same dimensions.  The repmat function is
% handy for this task:
meanMAs = repmat(meanMA, numberOfRows, 1);
MAplusMean = MA + meanMAs;
MAplusMean

% If you want to divide the elements in one matrix by the elements in
% another matrix you have to put a dot (.) before the division sign like this:  "./"
% If you want to multiply the elements in one matrix by the elements
% in another matrix you have to use:  ".*"
% In the homework, you will need to divide each element by the range
% of its column.  You can use the same pattern as shown above for addition.
