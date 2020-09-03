%This is for question 1
%Create the vector x = [1,2,...,100].
%Assign the even numbers of x to a new vector y
%to start I made the matrix then i made a variable c which is another 
%matrix which holds the module of each element of x % 2, but the == 0 makes
% it so that there is a one for even values and a zero for odd and I simply
%pulled out the equivalent elements
x = [1:1:100];
c = mod(x,2)==0;    
y = x(c);