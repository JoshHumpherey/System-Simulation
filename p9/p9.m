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
run=2;
Nr=10;
Ntheta=80;

rho=linspace(1,Nr,Nr)/Nr;
theta=linspace(0,(Ntheta-1)/Ntheta,Ntheta)*2*pi;
t=linspace(0,2*pi,501);


for T = 0.1:0.1:1
    w = T*((2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4));
    hold on
    figure(3)
    plot(real(w),imag(w),'DisplayName')
    title('\lambdaT Stability Regions for Different Sample Times')
    hold off
end
