% System Simulation Problem 9
% Written by Josh Humphrey

%% Part B %%
clear
N = 10000;
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H=(.0850*z.^4)./(2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1);
       
figure (1)
subplot(2,1,1)
plot(Omega,abs(H));
title('Frequency Response (Magnitude)')
        
subplot(2,1,2)
plot(Omega,angle(H));
title('Frequency Response (Angle)')

%% Part C %%
clear
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H=(2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4);

figure(2)
plot(real(H),imag(H));
title('AB-2 Stability Region') 

%% Part D %%
clear
N = 10000;
Omega=linspace(0,2*pi,N+1); 
z=exp(1i*Omega); 

for T = 0.1:0.1:1
    w = T*((2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4));
    hold on
    figure(3)
    plot(real(w),imag(w))
    legend('T=0.1','T=0.2','T=0.3','T=0.4','T=0.5','T=0.6','T=0.7','T=0.8','T=0.9','T=1.0')
    title('\lambdaT Stability Regions for Different Sample Times')
    hold off
end
