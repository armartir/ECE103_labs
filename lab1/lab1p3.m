%problem 3
%Use while loop to find the largest value of positive t
%for which and are both less than 10. Make the computation for ω=35, 40,
%and 45. Find your answers to the nearest 0.01. 
format bank
index = 1                                    %index for iterating matrix
w = [35:5:45]
vals = zeros(length(w), 2);
vals(1:3, 1) = w(1:3);
for w=35:5:45
    t = 0
    while t^3 < 10 && exp(1.2) * cos(w * t) < 10
        t = t + .01
    end
    t = t - .01        %need to subtract by .01 because the expression
    vals(index,2) = t  %above will take t to a point where the while 
    index = index + 1  %condition is not satisfied therefore we need to
end                    %increment down .01