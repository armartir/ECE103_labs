%problem 2 A signal x=0.6u(t+2)−cos(πt)+1()u(t+1)−u(t−1)[]−u(t−2){} with a 
%period −5 ≤ t ≤ 5 controls the location of the light source in an optical 
%scanner. Plot the signalfor the interval −5≤t≤25,its spectrum (Ck vs ω and
%∠Ckvsω), and reconstructed time domain signal using 51 Fourier Series 
%coefficients. Usethe function you have written in problem 1 for solving 
%this problem.
t = -5:.01:5;
x = .6.*( heaviside(t+2) - (cos(pi.*t) + 1).*(heaviside(t+1) - heaviside(t-1)) - heaviside(t-2) );
fourier_series_exp(x,t,51,1);
figure(3)
plot(t,x)
xlabel('t(s)');
ylabel('x(t)');
title('orignial signal');