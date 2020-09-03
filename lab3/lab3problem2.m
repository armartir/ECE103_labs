%lab1 problem 2: Using the example 
%Matlab file simplified_convolution_runtime.m, plot the output signals in 
%three separatefigure windows:(a) y1(t)=x1(t)∗h(t)(b)y2(t)=x2(t)∗h(t)
%(c)ylinear_comb=xlinear_comb(t)∗h(t). Use the ranges of ‘τ’ and ‘t’ as 
%−10≤τ≤40and −10≤t≤40. Also plot y3(t)=y1(t)+y2(t)and comment on 
%similarity of y3(t)and ylinear_comb(t)
clc
clear
figure (1) % Create figure window and make visible on screen


%%part a) signal: xo, impulse response: h
xo = @(t) 5.*(t>=0 & t<1);
h=@(t) 3*(exp(-t/5).*sin(2*t)).*(t>=3);
%
dtau = 0.05;  
tau = -10:dtau:40;              
dT=0.1;  
t = -10:dT:40;  
%%
figure (1)
yo = NaN(1, length (t)); 
for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
    x1h = h(t(ii)-tau).*xo(tau);                               
    yo(ii)=trapz(tau,x1h);   
    % plotting     
    subplot (211)    
    plot(tau, xo(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau');     
    legend('x1(\tau)','h(t-\tau)');   
    subplot (212)    
    plot (t, yo, 'k', t (ii), yo(ii), 'ok');    
    xlabel ('t'); 
    ylabel ('y1(t) = \int x1(\tau)h(t-\tau) d\tau');    
    drawnow;
end

%%part b
figure (2)
xt = @(t) 2*xo(t-10);
yt = NaN(1, length (t)); 
for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
    x2h = h(t(ii)-tau).*xt(tau);                               
    yt(ii)=trapz(tau,x2h);   
    % plotting     
    subplot (211)    
    plot(tau, xt(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau');     
    legend('x1(\tau)','h(t-\tau)');   
    subplot (212)    
    plot (t, yt, 'k', t (ii), yt(ii), 'ok');    
    xlabel ('t'); 
    ylabel ('y2(t) = \int x1(\tau)h(t-\tau) d\tau');    
    drawnow;
end

%%part c
figure (3)
xcomb = @(t) xo(t) +xt(t);
yc = NaN(1, length (t)); 
for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
    xch = h(t(ii)-tau).*xcomb(tau);                               
    yc(ii)=trapz(tau,xch);   
    % plotting     
    subplot (211)    
    plot(tau, xcomb(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau');     
    legend('x1(\tau)','h(t-\tau)');   
    subplot (212)    
    plot (t, yc, 'k', t (ii), yc(ii), 'ok');    
    xlabel ('t'); 
    ylabel ('y3(t) = \int x1(\tau)h(t-\tau) d\tau');    
    drawnow;
end
%part d
ythree = yo + yt;
figure(4)
plot(t,ythree)
xlabel ('t');
ylabel ('y(t)');
title('part d: y3(t)')