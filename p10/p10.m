% System Simulation Problem 10
% Written by Josh Humphrey

%% Part B %%
N = 10000;
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H=(0.297046*z.*(z.^4-0.982666*z.^3+0.712641*z.^2-0.221309*z+0.0553271))./(z.^5-1.89353*z.^4+1.70189*z.^3-0.843832*z.^2+0.2302*z-0.0272007);
       
figure (1)
subplot(2,1,1)
plot(Omega,abs(H));
title('Frequency Response (Magnitude)')
        
subplot(2,1,2)
plot(Omega,angle(H));
title('Frequency Response (Angle)')