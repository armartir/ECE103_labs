%problem 2: Calculate the energy of time domain signal x(t)and z(t)for the 
%range of 0≤t≤2.5. Also calculate the energy of these signals in frequency 
%domain using Parseval’s theorem. Plot Energy(X)and Energy(Z)as  a  
%function of frequency fin  a  2x1  subplot(Energy vs frequency plot is 
%know as energyspectrumof a signal).
clear 
close all
t = 0:.01:2.5;
load('ecg_signal(1).mat')
xt = ecg;
f = 0:.1601:200;
w = f .* (2 * pi);
Xw = fft(ecg, length(t));
Hw = ((1 + .9) * ((2 * j * w * 10000 * (133 * 10^(-7))) .^ 2) + 1 ) / ((2 .* j .* w .* 10000 .* (1.33 .* 10^-7)) .^2 + (4 * (1 - .9) * j * w * 10000 * (1.33 * 10^-7)) + 1); 
Zw = Xw .* Hw;
zt = ifft(Zw, length(t));
energyxt = trapz(t, abs(xt).^2);
energyzt = trapz(t, abs(zt).^2);
for i = 1:length(Xw)
    energyXw(i) = sum(real(Xw(i)).^2 + imag(Xw(i)).^2);
    energyZw(i) = sum(real(Zw(i)).^2 + imag(Zw(i)).^2);
end
figure(1)
subplot(2,1,1);
plot(f, energyXw)
title('plot of the energy spectrum of X(w)')
xlabel('f')
ylabel('energy(X(w))')
subplot(2,1,2);
plot(f, energyZw)
title('plot of the energy spectrum of Z(w)')
xlabel('f')
ylabel('energy(Z(w))')