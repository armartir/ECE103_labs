%problem 2:
%Use for loop to find the values of for t = 0, 0.1, 0.2, 0.3, 0.4 s
%when f =10, 15,and 20 Hz. Use one set of statements to compute 
%the values for all three frequencies and store the results in a 
%two-dimensional array. Use two nested for loops and double indexing.
t = [0:.1:.4];                      %creating the headers Note: the first
f = [10:5:20];                      %element of the array is zero due to my format
g = zeros(length(t)+1,length(f)+1); %creating the array
g(2:6,1) = t(1:5);                  %dealing with axis  
g(1,2:4) = f(1:3);
first = 2;                          %incrementing the time
for t=0:.1:.4
    second = 2;                     %incrementing frequency
    for f=10:5:20
        xt = 3 * cos(2*pi*f*t + .1);
        g(first,second) = xt;
        second = second + 1;
    end
    first = first + 1;
end