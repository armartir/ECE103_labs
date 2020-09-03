%problem 2: For the following functionx(t)=−2t+10,t∈[−5,5)10,t∈[5,10)
%0,elsewhere create an m-file that plots the function x(t)within 
%the window t∈[−10,15]. Also create a separate figure that has 4 sublpots 
%in 2-by-2 arrangement with the following signals:(a) x(t+2)(b) x(t-3)
%(c) x(-t)(d) -3x(-t+4)
%we want x(t)= -2|t| + 10 when -5 <=t <5, we want x(t) = 10 when 5 <= t< 10
%parent figure(Note: i followed the example from the pdf provided):
tone = -10:.01:-4.99;
ttwo = -5:.01:5;
tthree = 5.01:.01:9.99;
tfour = 10:.01:15;
t = [tone ttwo tthree tfour];
f1 = zeros(size(tone));
f2 = -2 .* abs(ttwo) + 10;
f3 = (ones(size(tthree))) * 10;
f4 = zeros(size(tfour));
f = [f1 f2 f3 f4];
figure (1)
plot(t,f);
legend('x(t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('parent function');
%part a:
figure (2)
subplot(2,2,1)
plot(t+2,f);
legend('x(t+2)');
xlabel('time(seconds)');
ylabel('x(t)');
title('part a: x(t+2)');
%part b:
subplot(2,2,2)
plot(t-3, f);
legend('x(t-3)');
xlabel('time(seconds)');
ylabel('x(t)');
title('part b: x(t-3)');
%part c:
subplot(2,2,3)
plot(-t,f);
legend('x(-t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('part c: x(-t)');
%part d:
subplot(2,2,4)
plot(-t+4, -3*f);
legend('-3x(-t+4)');
xlabel('time(seconds)');
ylabel('X(t)');
title('part d: -3x(-t+4)');