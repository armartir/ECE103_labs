%problem 3: Calculate
close all
clear all
clc

fc=400e3;         % 100 kHz carrier    
fs=fc / 10;       % This time we want 1/10th of the frequency
dT=1/fs;
m=[6 0 4 -6 2];  % message
fm=fc/10;         % message frequency (10 kHz)
t=0:1/fs:length(m)/fm-1/fs; % itme vector (s)
%% modulating message with carrier
xc=cos(1000 * 10^3 * pi * t);% carrier signal
xm=[];  % message signal initiation
for ii=1:length(m)    
    xm=[xm m(ii)*ones(1,length(t)/length(m))];
end


%% DSB-SC Modulation
s= xm.*xc;  % modulated signla
figure(1)
subplot(411)
plot(t,s);
title('time domain signal transmitted'); %%%were finna use
xlabel('time (sec)');
ylabel('amplitude');

% frequency domain
S=fftshift(fft(s,length(s))*dT);
W=linspace(-pi,pi,length(S)); % digital angular frequency
w=W/dT; % angular frequency (rad)
f=w/2/pi;  % frequency (Hz)
subplot(412)
plot(f,abs(S));
title('domain magnitude of transmitted signal'); %%%%%
xlabel('frequency(Hz)');
ylabel('amplitude');
XC=fftshift(fft(xc,length(xc))*dT);
W=linspace(-pi,pi,length(XC)); % digital angular frequency
w=W/dT; % angular frequency (rad)
f=w/2/pi;  % frequency (Hz)

%% Demodulation 
v=s.*xc;
V=fftshift(fft(v,length(v))*dT);
%%%%%%%%%%%%%%%%%

for jj=1:length(f)
    if abs(f(jj)) < (500 * 10^3)      
        Hlp(jj)=2;      % during the demodulation process, the
                        % magnitude of the signal drops to half
                        % low pass filter with magnitude of 2
                        % restores the correct magnitude
    else
        Hlp(jj)=0;    
    end
end
% Hlp=1./sqrt(1+(f./fc).^(2*100)); % 100th order low pass filter
%% frequency domain demodulation
V0=Hlp.*V;
subplot(413)
plot(f,V0);
title(' Corresponding frequency domain spectrum'); %%%%
xlabel('frequency(Hz)');
ylabel('amplitude');

%% time domain demodulation
v0=(ifft(ifftshift(V0)))/dT;
subplot(414)
plot(t,v0);
title(' output signal');
xlabel('time(sec)');
ylabel('amplitude');