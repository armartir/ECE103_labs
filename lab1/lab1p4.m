%problem 4
% Create a 15-element vector with values of at equally spaced interval.
%Find the maximum element value, the minimum element value,
%the average of the element values, and the indices of the elements for 
%which the element magnitude is greater than 4.
start = 1;
index = 1;
xt = zeros(1,15);
for t=linspace(0,1,15)     %linespace evenly spaces out the elements
    calc = 4*cos(2*pi*t + .2) + 3*sin(pi^2*t);
    xt(start) = calc;
    start = start + 1;
end
for g=1:1:15
    if abs(xt(g) / 4) > 1  %if the element if greater than 4
        val(index) = g
        index = index + 1
    end
end
maximum = max(xt)
minimum = min(xt)
average = mean(xt)
val