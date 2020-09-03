%lab5 problem 1: A time domain real-signalx(t)has a Fourier Transform 
%property of X(ω)= X*(-ω). Consider the following frequency domain 
%description of a signal G(ω):G(ω)=2,5≤ω≤100,elsewhere⎧⎨⎪⎩⎪.
%(a)Evaluate g(t)using the definition of Inverse Fourier Transformation
%g(t)=12πG(ω)ejωtdω−∞∞∫⎛⎝⎜⎞⎠⎟Plot G(ω),Re(g(t)),and Im(g(t))in a 3x1 
%subplot for the intervalω=-31.4:0.01:31.4and t=-100:0.1:100.
%(b)Now consider Y(ω)=G(ω-5). Plot Y(ω), Re(y(t)), and Im(y(t))in a 3x1 
%subplot with the same intervals. (c)Are g(t)and y(t)real-signal or 
%complex signal?
clear
close all
w = -31.4:.01:31.4;
t = -100:0.1:100;
gw  =  2 .* (abs(w)>=5 & abs(w)<=10);
yw = 2 .* (abs(w-5)>=5 & abs(w-5)<=10);
i = 0;
for st = -100:0.1:100;
    i = i + 1;
    gt(i) = (1 / (2 * pi)) .* trapz(w, gw .* exp(j .* w .* st));
    yt(i) = (1 / (2 * pi)) .* trapz(w, yw .* exp(j .* w .* st));
end
%plotting part a
figure(1)
subplot(3,1,1);
plot(w, gw)
title('plot of the frequency domain signal g(w)')
xlabel('w')
ylabel('g(w)')
subplot(3,1,2);
plot(t, real(gt))
title('plot of the real aspect of g(t)')
xlabel('t(s)')
ylabel('Re(g(t))')
subplot(3,1,3);
plot(t, imag(gt))
title('plot of the imaginary aspect of g(t)')
xlabel('t(s)')
ylabel('Im(g(t))')
%plotting part b
figure(2)
subplot(3,1,1);
plot(w, yw)
title('plot of the frequency domain signal y(w)')
xlabel('w')
ylabel('y(w)')
subplot(3,1,2);
plot(t, real(yt))
title('plot of the real aspect of y(t)')
xlabel('t(s)')
ylabel('Re(y(t))')
subplot(3,1,3);
plot(t, imag(yt))
title('plot of the imaginary aspect of y(t)')
xlabel('t(s)')
ylabel('Im(y(t))')


