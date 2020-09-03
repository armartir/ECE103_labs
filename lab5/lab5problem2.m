%lab5 problem 2: When the signal g(t)goes through a filter h(t) where 
%the frequency domain definition of the filter is:H(ω)=5ω,ω≤200,
%elsewhere⎧⎨⎪⎩⎪,theresults in a time domain output signal:m(t).
%(a)Using convolution theorem, calculate the frequency domain 
%output signal M(ω).Plot the magnitude and phase of M(ω)in a2x1 
%subplot for the intervalω=-31.4:0.01:31.4.(b)Evaluate m(t)using the 
%definition of Inverse Fourier Transformation. 
%Plot Re(m(t))and Im(m(t))in a 2x1 subplot for the interval t=-100:0.1:100.
clear
close all
w= -31.4 : 0.01 : 31.4;
%part a
hw = (5 .* abs(w)) .* (abs(w) <= 20);
gw  =  2 .* (abs(w)>=5 & abs(w)<=10); 
% since g(t) goes through the filter h(t) we can use the convolution 
%theorem 
mw = hw .* gw;
figure(1)
subplot(2,1,1);
plot(w, abs(mw))
title('plot of the magnitude of m(w)')
xlabel('w')
ylabel('abs(m(w))')
subplot(2,1,2);
plot(w, angle(mw))
title('plot of the phase of m(w)')
xlabel('w')
ylabel('angle(m(w))')
%part b
t = -100:0.1:100;
i = 0;
for st = -100:0.1:100
    i = i + 1;
    mt(i) = (1 / (2 * pi)) .* trapz(w, mw .* exp(j .* w .* st));
end
figure(2)
subplot(2,1,1);
plot(t, real(mt))
title('plot of the real part of m(t)')
xlabel('t(s)')
ylabel('real(m(t))')
subplot(2,1,2);
plot(t, imag(mt))
title('plot of the imaginary aspect of m(t)')
xlabel('t(s)')
ylabel('imag(m(t))')