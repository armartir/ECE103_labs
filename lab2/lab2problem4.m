%problem 4: 4. For the signal g(x)in problem 1, calculate the energy of 
%the signal in the window t∈[0.25,0.75]. Also calculate thepower 
%of the signal.
%limit(f,x,0)
%energy first:
fun = @(t) abs(3 .* pi .* sin(8 .* pi .* t + 1.3) .* cos(4 .* pi .* t - .8) .* exp(sin(12 .* pi .* t))).^2;
energy = integral(fun, .25, .75)
%power
bigt = .75 - .25;
power = 1/bigt * integral(fun, -bigt/2, bigt/2)