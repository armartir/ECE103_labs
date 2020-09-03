%problem 5
%Sinc function is a function that arises frequently in our course. 
%It is defined as Create a Matlab function MySinc () that defines sinc(x)
%function following the above definition. Plot the value sinc(x) in the 
%interval [-2π 2π] using MySinc () function and Matlab inbuilt sinc() 
%function on the same graph.
x = -2*pi:.01:2*pi;
library = sinc(x);
mysin = MySinc(x);
figure (2)
plot(x, mysin)
hold on 
grid on
plot(x,library)
legend('Mysinc', 'sinc');
xlabel('x');
ylabel('y');
title('my function vs the library function')


function mine = MySinc(g)
    if g == 0
        mine = 1
    else
        mine = sin(g)./g
    end
end


