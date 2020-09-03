%problem 1 Following RLCcircuit is described by the differential equation 
%(1). UseMatlab built-in differential equation solver dsolve()to derive 
%the impulse response h(t)for this circuit when R=2Ω, C=1F, L=0.5 H.
%Plot the impulse response h(t)from a range −10≤t≤30.
close all
clear 
clc
t = -10:.01:30;
y_n = dsolve('(2 * D2y) + Dy + (4 * y)=0','y(0)=0','Dy(0)=1', 't');
ht = diff(y_n);
disp(['impulse response h(t) = (',char(ht),')u(t)']);
h = @(t) (((exp(-t/4).*cos((31^(1/2)*t)/4)) - (131^(1/2).*exp(-t/4).*sin((31^(1/2).*t)/4))/31)).*(t>=0);
figure(1)
plot(t,h(t));
legend('h(t)');
xlabel('time(seconds)');
ylabel('impulse response h(t)');
title('impulse response of provided RLC circuit')