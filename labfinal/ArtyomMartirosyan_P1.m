%final exam problem 1
%Consider the time domain signal x(t) = sinc(t).(a)  (20 points)  
%Compute the Fourier transform of x(t) as follow
clear
close all

%part a(20 points)Compute the Fourier transform ofx(t) as follows
t = -20:.1:20;                          %Declairing main variables here
w = -10:0.01:10;
x = sinc(t);                            %Function x(t)
for ii=1:length(w)                         %This is essentially the summation
    Xw(ii)=trapz(t,x .* exp(-j*w(ii)*t));  %Used for solving X(w)
end
figure(1) %plotting
subplot(2,1,1);
plot(w, abs(Xw))
title('plot of the absolute value of X(w) vs w')
xlabel('w')
ylabel('|x(w)|')
subplot(2,1,2);
plot(w, angle(Xw))
title('plot of the angle of X(w) vs w')
xlabel('w')
ylabel('angle(xw)')
% part b(15 points) Compute the energy of the time domain signalx(t) as follows
% Note: in these next two parts the expectation is for the energy from both
% methods to be the same as shown in Parseval's Theorem
energyxt = trapz(t, abs(sinc(t)).^2); % simply used trap integration in terms of dt
% part c(15 points) Compute the energy of the frequency domain signalX(w) as follows
energyxw = (1 / (2 * pi)) * trapz(w, abs(Xw).^2); % again using integration but in terms of dw
