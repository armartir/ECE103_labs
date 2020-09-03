%lab5 problem 3: Calculate the energy of the output signal m(t)for the time
%range t=-100:0.1:100. Also evaluate the energyof the output signal in 
%frequency domain using Parseval’s theorem(use the frequency range 
%ω=31.4:0.01:31.4).
clear
close all
w = -31.4:.01:31.4;
t = -100:0.1:100;
hw = (5 .* abs(w)) .* (abs(w) <= 20);
gw  =  2 .* (abs(w)>=5 & abs(w)<=10); 
% since g(t) goes through the filter g(t) we can use the convolution 
%theorem 
mw = hw .* gw;
i = 0;
for st = -100:0.1:100
    i = i + 1;
    mt(i) = (1 / (2 * pi)) .* trapz(w, mw .* exp(j .* w .* st));
end
%part a: find the energy of the output signal for m(t)
energymt = trapz(abs(mt).^2)
%part b: using parsevals theorem e = 1/2pi * integral(abs(mw)^2mw)
energymw = (1 / (2 * pi)) * trapz(w, abs(mw).^2)