%lab3 problem 4 A  single-tone  signal w(t)=sin(400πt)is  transmitted  to  
%an  audio  amplifier and speaker to produce a high-temperature warning 
%for a silicon crystal-growing factory. A filter having impulse response 
%h(t)=400e−200tcos(400πt)u(t)has been designed to  reduce  additive  
%interference  in  the  received  signal.  Using  Matlab  in-built  
%convolution function: conv(),  find  the  filter  output  signal y(t),  
%when  the  received  signal  is x(t)=[cos(100πt)+sin(400πt)−cos(800πt)]
%u(t)(    signal w(t)was corrupted byinterference and resulted in an input 
%signal x(t)). Plot the output signal, the input signal, and w(t)for the 
%range of −0.1≤t≤0.1. Comment on the effect of  the  filter  on  the  
%signal. While  solving  this  problem,  pay  attention  to  the  time 
%resolution/step (dT) you need to use. 
clear
close all
t = -.1:.001:.1;
xt = (cos(100 * pi * t) + sin(400 * pi * t) - cos(800 * pi * t)).*(t>=0);
wt = sin(400 * pi * t);
ht = (400 * exp(-200 * t) .* cos(400 * pi * t)).*(t>=0);
yt = conv(xt,ht, 'same');
%output
figure (1);
plot(t,yt);

grid;
legend('y(t)');
xlabel('time(seconds)');
ylabel('y(t)');
title('output signal(y(t))');
%input signal
figure (2);
plot(t,xt);
legend('x(t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('input signal(x(t))');
%w(t)
figure (3);
plot(t,wt);
legend('w(t)');
xlabel('time(seconds)');
ylabel('w(t)');
title('single-tone signal(w(t))');