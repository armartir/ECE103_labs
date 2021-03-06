%problem 3: So far all the signals we have handled in this course are real 
%signals. However, we can also use complex numbers to represent signals 
%(complex signals). Let’s consider asingle period of aperiodic signal 
%z(t)=t3−j2πt2,0<t≤5. Calculate 51 Fourier Series coefficients (Ck) for 
%this signal and reconstruct the time domain signal ˆz(t) using these 
%Fourier Series coefficients. Plot the spectrum (Ck vs ω and ∠Ck vs ω) and
%the real and imaginary part of z(t)and ˆz(t)for an interval of 0≤t≤10.
%You can modify the Matlab file ‘fs_numerical.m’ which was used during the 
%lab for solvingthis problem. Following are the sample plots for your 
%reference.
%x_single_period(t)= 5, 0<t<1 , T=2 
%                   -5, 1<t<2  
%x_periodic(t),     0<t<5T
close all
clear all
clc
t = 0 : .1 : 5;
zt = t.^3 - (j * 2 * pi * t.^2)
fourier_series_exp(zt,t,51,1);
%% single period defination
dT=0.01;
t1=0:.01:5;
t2=5.01:.01:10;
x1=5*ones(size(t1));
x2=-5*ones(size(t2));
x_single_period=[x1 x2];
t_single_period=[t1 t2]; % single period is from 0 to 2
%% period and fundamental angular freq.
T=5;
w0=2*pi/T; 

%%
%% replicating single period
number_of_periods=5;
x_extended=repmat(x_single_period,1,number_of_periods);   % 1 row, 5 column: number of periods
% generating new 'time' variable to match signal 'x_extended'
t_extended=linspace(t_single_period(1),t_single_period(1)+(length(x_extended)-1)*...
    (t_single_period(2)-t_single_period(1)),length(x_extended));

xlim([0 10])
%% exponential FS, approximation with 51 terms for the real part of z(t)
k=-25:25; %k=index of harmonics
for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t_single_period, t_single_period.^(2).*exp(-j*k(ii)*w0*t_single_period))
end
w0k=w0*k;  % different hermonic angular frequencies
figure (4)
subplot(211)
stem(k,abs(Ck))
hold on
% set(gca,'xtick',w0k,'xticklabels',{'-5\omega_0','-4\omega_0',...
%     '-3\omega_0','-2\omega_0','-\omega_0','0','\omega_0',...
%     '2\omega_0','3\omega_0','4\omega_0','5\omega_0'});
legend('Magnitude spectrum  k=-25:25')
xlabel('\omega')
subplot(212)
stem(w0k,angle(Ck)*180/pi);
% set(gca,'xtick',w0k,'xticklabels',{'-5\omega_0','-4\omega_0',...
%     '-3\omega_0','-2\omega_0','-\omega_0','0','\omega_0',...
%     '2\omega_0','3\omega_0','4\omega_0','5\omega_0'});
legend('Phase spectrum  k=-25:25')
xlabel('\omega')
ylabel('degrees')

%% signal reconstruction from FS components
% reconstructing 'number_of_periods' cycles

t_reconstracted=linspace(t_single_period(1),t_single_period(1)+...
    (number_of_periods*length(t_single_period)-1)*(t_single_period(2)-t_single_period(1)),...
    number_of_periods*length(x_single_period));
x_reconstracted=zeros(1,length(t_reconstracted));  % initiating with zeros (0)
for ii=1:length(k)
    x_reconstracted=x_reconstracted+Ck(ii)*exp(j*k(ii)*w0*t_reconstracted);
end
figure(3)
subplot(211)
plot(t_reconstracted,x_reconstracted)
xlabel('t');
ylabel('real part of z')
title('approximation with 51 terms')
xlim([0 10])
subplot(212)
plot(t_reconstracted,x_reconstracted.^-1)
xlabel('t');
ylabel('imaginary part of z')
title('approximation with 51 terms')
xlim([0 10])