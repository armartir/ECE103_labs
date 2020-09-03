%problem 1:
%part a) For m={0.8, 0.9} plot the magnitude and phase responseof H(ω) 
%with arange of f=ω/2π=[0, 200 Hz]
clear 
close all
m = [0.8, 0.9];
f = 0:.1:200;
w = f .* (2 * pi);
Zw1 = (1 + m(1)) .* (((2 .* j .* w .* 10000 .* (133 * 10^(-7))) .^ 2) + 1);
Xw1 = (2 .* j .* w .* 10000 .* (1.33 .* 10^-7)) .^2 + (4 * (1 - m(1)) * j * w * 10000 * (1.33 * 10^-7)) + 1;
Hw1 = Zw1 ./ Xw1;
Zw2 = (1 + m(2)) .* (((2 .* j .* w .* 10000 .* (133 * 10^(-7))) .^ 2) + 1);
Xw2 = (2 .* j .* w .* 10000 .* (1.33 .* 10^-7)) .^2 + (4 * (1 - m(2)) * j * w * 10000 * (1.33 * 10^-7)) + 1;
Hw2 = Zw2 ./ Xw2;
figure(1)
subplot(2,2,1);
plot(f, abs(Hw1))
title('plot of the magnitude of H(w) at m = .8 ')
xlabel('f')
ylabel('|H(w)|')
subplot(2,2,2);
plot(f, angle(Hw1))
title('plot of the phase of H(w) at m = .8 ')
xlabel('f')
ylabel('angle(H(w))')
subplot(2,2,3);
plot(f, abs(Hw2))
title('plot of the magnitude of H(w) at m = .9 ')
xlabel('f')
ylabel('|H(w)|')
subplot(2,2,4);
plot(f, angle(Hw2))
title('plot of the phase of H(w) at m = .9 ')
xlabel('f')
ylabel('|H(w)|')
%part b note we are only doing everything in terms of m = .9

load('ecg_signal(1).mat')
xt = ecg;
bf = -250:.25:250;
bt = 0:.1:2.5;
Xw = fft(xt, length(bf));
zt = ifft(Zw2, length(t));
figure(2)
subplot(4,1,1);
plot(t, xt)
title('plot of x(t) vs t')
xlabel('t(seconds)')
ylabel('x(t)')
subplot(4,1,2);
plot(bf, Xw)
title('plot of X(f) ')
xlabel('f')
ylabel('X(f)')
subplot(4,1,3);
plot(bf, Zw2)
title('plot of Z(f) ')
xlabel('f')
ylabel('Z(f)')
subplot(4,1,4);
plot(t, zt)
title('plot of =z(t) ')
xlabel('f')
ylabel('z(t)')
