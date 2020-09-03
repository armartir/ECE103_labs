%problem 5 Suppose Ndifferent musiciansin an orchestraare trying 
%to play a pure tone, a sinusoid of frequency 160Hz. Assume the N 
%players while trying to play the pure tone(160Hz)end up playing tones 
%separated by ΔHz, so the overall sound they producedis:
%y(t)=10cos(2πfit)i=1N∑where the fiare the frequencies from 159to 161Hz. 
%Generate the signal y(t), 0 ≤t ≤ 200sec considering that each musician 
%is playing a unique frequency. First assume thenumber of musicians to be 
%N=51with Δ= 0.04Hz, and thenN=101with Δ= 0.02Hz. Plot y(t)for the two
%caseson the same figure. 
%first case
fone = 159:.04:161;
ftwo = 159:.02:161;
t = 0:.01:200;
yone = 0;           %these variable need to be initialized before in order
ytwo = 0;           %for the loops to run
for none = 1:51
    yone = yone + (10 * cos(2*pi*fone(none)*t));
end
for ntwo = 1:101
    ytwo = ytwo + (10 * cos(2*pi*ftwo(ntwo)*t));
end
figure (1)
plot(t, yone)
hold on 
grid on
plot(t,ytwo)
legend('first case', 'second case');
xlabel('t(seconds)');
ylabel('y(t)');
title('frequencies')
