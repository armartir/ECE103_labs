%problem 1 During lab 4, we have seen numerical implementation of 
%Fourier Series forperiodic signals. As first part of this assignment, 
%you need to write a Matlab function that would take an array representing 
%a single period of a signal (x), corresponding timearray(t), and return 
%the Fourier Series coefficients (Ck)in exponential form. The function 
%should also be able to take two (2)optional input arguments: number of 
%Fourier coefficients (Nk) and plot option (p). Use the template 
%‘fourier_series_exp.m’ forthis problem. 
function [Ck]=fourier_series_exp(x,t,Nk,p)

% Ck = exponential fourier series cofficient  
% x = single period of a signal
% t = time corrosponding to 'x'
% Nk = (optional input) number of exponential terms
% p = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal 
% dT = t(2)-t(1) = temporal resolution of signal (x)
% T = peiod of signal 'x'
% w0= angular frequency of signal 'x'
    dT=t(2)-t(1);    
    T= dT*length(t);   
    w0=2*pi/T;       
    
    % Check the number of inputs, 'nargin' returns number of input arguments     
    if nargin <2        
        error('Not enough input argument!')    
    elseif nargin == 2        
        Nk=101;   % you can set any default value you like        
        p=0;      % not plots    
    elseif nargin ==3       
        p=0;      % not plots    
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6   
    %% evaluate Ck        
    %        
    % % % write this code segment  
    for i = 1:length(k)
        Ck(i) = (1/T)*trapz(t,x.*exp(-j*k(i)*w0*t));
    end
k=-floor(Nk/2):floor(Nk/2);
    %%% plot spectrum and reconstructed signal         
    if p==1        
        % plot abs(Ck) vs k and angle(Ck) vs k        
        %        
        % % % write this code segment
        figure(1)
        subplot(2,1,1)
        plot(k,abs(Ck))
        xlabel('k');
        ylabel('|Ck|');
        title('abs(Ck) vs k');
        subplot(2,1,2)
        plot(k,angle(Ck));
        xlabel('k');
        ylabel('Ck');
        title('angle(Ck) vs k');
        %        
        % plot 3 cycles of the signal 'x' and the reconstructed signal        
        %        
        % % % write this code segment
        threet = dT:dT:T*3;
        figure(2)
        plot(threet,repmat(x, 1, 3))
        xlabel('t(s)');
        ylabel('x(t)');
        title('reconstructed signal');
        %    
    end
end