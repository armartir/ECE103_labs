% Problem 3: Consider the signal x(t)=te−0.15t,−20≤t≤20.Plot
%(a) The signal x(t)
%(b) The even decomposition xe(t)of x(t)
%(c) The odd decomposition xo(t)of x(t)
%(d) The signal y(t)=xe(t)+xo(t)
%Part a:
t = -20: .1 :20;
xt = t .* exp(-.15 .* t);
figure (1)
subplot(4,1,1);
plot(t, xt)
legend('x(t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('base signal');
%part b
xnegt = -t .* exp(-.15 .* - t);
evenx = .5 * (xt + xnegt);
subplot(4,1,2);
plot(t, evenx)
legend('xe(t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('even decomposition of x(t)');
%part c
oddx = .5 * (xt - xnegt);
subplot(4,1,3);
plot(t,oddx)
legend('xo(t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('odd decomposition of x(t)');
%part d
yt = evenx + oddx; 
subplot(4,1,4);
plot(t, yt)
legend('y(t)');
xlabel('time(seconds)');
ylabel('x(t)');
title('y(t) = xe(t) + xo(t)');