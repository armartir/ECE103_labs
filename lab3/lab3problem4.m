%lab 3 problem 4 System response for an IndustrialShock Absorber
%(figure below) can be modeled with the following differential 
%equation:Md2y(t)dt2+bdy(t)dt+ky(t)=r(t)...(2)Let’s assume the mass of the 
%damper M is 100 kg, the springconstant kis 1 kgs-2, andthe friction 
%coefficient bis20 kgs-1. UsingMatlabbuilt-in differential equation solver 
%dsolve()to derive the impulse response h1(t)for this IndustrialShock 
%Absorber andthe impulse response h1(t)from a range −10s≤t≤300s. Overtime 
%the oil inside the shock absorberdegradesand the friction coefficient b 
%becomes 0.2kgs-1.Derive the new impulse response h2(t)for this Industrial 
%Shock Absorber andploth2(t)from a range −10s≤t≤300s.
clear 
close all
t = -10:1:300;
yone = dsolve('100*D2y + 20 * Dy + y = 0', 'y(0) = 0', 'Dy(0)=1', 't');
ytwo = dsolve('100*D2y + .2 * Dy + y = 0', 'y(0) = 0', 'Dy(0)=1', 't');
honeprior = diff(yone);
htwoprior = diff(ytwo);
disp(['impulse response h_1(t) = (',char(honeprior),')u(t)']);
disp(['impulse response h_2(t) = (',char(htwoprior),')u(t)']);
hone = ((exp(-t/10) - (t.*exp(-t/10))/10)) .*(t>=0);
htwo = ((exp(-t/1000).*cos((3.*1111^(1/2).*t)/1000)) - (1111^(1/2).*exp(-t/1000).*sin((3.*1111^(1/2).*t)/1000))/3333).*(t>=0);
figure (1)
plot(t,hone);
legend('h_1(t)');
xlabel('time(seconds)');
ylabel('h_1(t)');
title('impulse response when the friction coefficient is 20 kgs(h_1(t))');
figure (2)
plot(t,htwo);
legend('h_2(t)');
xlabel('time(seconds)');
ylabel('h_2(t)');
title('impulse response when the friction coefficient is .2 kgs(h_2(t))');

