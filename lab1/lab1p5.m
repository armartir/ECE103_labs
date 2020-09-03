%problem 5
%Assumes1 = sin(2πf1t), s2 = sin(2πf2t + 0.4) ands3 = s1 + s2 , where
%f1 = 0.2 and f2 = 0.425. Plots1, s2 and s3 v/s t with t = 0:0.1:10 on
%the same graph (you have to use hold on command). Label the axes and 
%create legends for each graph.
t = 0:0.1:10;
sone = sin(2*pi*.2*t);
stwo = sin(2*pi*.425*t+.4);
sthree = sone + stwo;
figure (1)
plot(t,sone);
hold on
grid on                     %used to keep grid so waves are normal
plot(t,stwo);
plot(t,sthree);
legend('s1', 's2', 's3');
xlabel('time(seconds)');
ylabel('voltage(volts)');
title('v/s for s1,s2,s3')