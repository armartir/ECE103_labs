%problem 1: For the following function:
%g(t)=3πsin(8πt+1.3)cos(4πt−0.8)esin(12πt)
%create an m-file that plots the function within the window t∈[−1,1]
%in a 3-by-1 subplot with steps of tequal to 0.1, 0.01,and 0.001. 
%What is the period of this signal?
t = -1:.1:1;
gone = 3 .* pi .* sin(8 .* pi .* t + 1.3) .* cos(4 .* pi .* t - .8) .* exp(sin(12 .* pi .* t));

figure (1)
subplot(3,1,1);
plot(t,gone);
legend('t = .1');
xlabel('time(seconds)');
ylabel('G(t)');
title('g(t) where t = .1');
t = -1:.01:1;
gtwo = 3 .* pi .* sin(8 .* pi .* t + 1.3) .* cos(4 .* pi .* t - .8) .* exp(sin(12 .* pi .* t));
subplot(3,1,2);
plot(t,gtwo);
legend('t = .01');
xlabel('time(seconds)');
ylabel('G(t)');
title('g(t) where t = .01');
t = -1:.001:1;
gthree = 3 .* pi .* sin(8 .* pi .* t + 1.3) .* cos(4 .* pi .* t - .8) .* exp(sin(12 .* pi .* t));
subplot(3,1,3);
plot(t,gthree);
legend('t = .001');
xlabel('time(seconds)');
ylabel('G(t)');
title('g(t) where t = .001');
