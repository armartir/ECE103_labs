%final exam problem 2

close
clear all

% part a: (10 points) Plot|H(w)|and∠H(w) over the interval
%        w=−30 : 0.1 : 30 on a 2x1 subplot.
w = -30:0.1:30;
t = -15:0.01:15;
Hw = (1 - (j .* w)) ./ (1 + (w .^ 2)); % simply plugging in formula for h(w)
%plotting the absolute and phase values of h(w)
figure(1)
subplot(2,1,1);
plot(w, abs(Hw))
title('plot of the absolute value of H(w) vs w')
xlabel('w')
ylabel('|H(w)|')
subplot(2,1,2);
plot(w, angle(Hw))
title('plot of the angle of H(w) vs w')
xlabel('w')
ylabel('angle(Hw)')
% part b: (20 points) Compute  the  time  domain  impulse  response,h(t),  
%         of  the  system  using  theinverse Foruier transform given by
i = 0;
for st = -15:0.01:15; % This is the summation for h(t)(inverse fourier)
    i = i + 1;
    Ht(i) = (1 / (2 * pi)) .* trapz(w, Hw .* exp(j .* w .* st));
end
%plotting the real and imaginary aspects of h(t)
figure(2)
subplot(2,1,1);
plot(t, real(Ht))
title('plot of the real aspect of H(t) vs t')
xlabel('t(seconds)')
ylabel('real(H(t))')
subplot(2,1,2);
plot(t, imag(Ht))
title('plot of the imaginary aspect of H(t) vs t')
xlabel('t(seconds)')
ylabel('imag(H(t))')
% part c:(20 points) The response of the system to the inputx(t) can be 
%expressed in the frequency domainasY(w) =H(w)X(w).  Compute the time 
%domain response, y(t), of the system using theinverse Foruier transform 
%given by...
Xw = 2 * sinc((2 .* w) ./ pi) .* exp(-4 * j .* w); % function for X(w)
Yw = Xw .* Hw;                                  % function for y(w)
ii = 0;
for sect = -15:0.01:15; %The summation for the inverse fourier of y(w)
    ii = ii + 1;
    yt(ii) = (1 / (2 * pi)) .* trapz(w, Yw .* exp(j .* w .* sect));
end
%plotting the real and imaginary aspects of y(t)
figure(3)
subplot(2,1,1);
plot(t, real(yt))
title('plot of the real aspect of y(t) vs t')
xlabel('t(seconds)')
ylabel('real(y(t))')
subplot(2,1,2);
plot(t, imag(yt))
title('plot of the imaginary aspect of y(t) vs t')
xlabel('t(seconds)')
ylabel('imag(y(t))')
