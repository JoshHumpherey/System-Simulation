% System Simulation Problem 9
% Written by Josh Humphrey

%% Part B %%
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
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H=(2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4);

figure(2)
plot(real(H),imag(H));
title('AB-2 Stability Region') 

%% Part D %%