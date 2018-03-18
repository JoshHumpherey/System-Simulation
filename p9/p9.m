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
N = 10000;
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
w=((2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4)).*(2*z.*(z-1)./(3*z-1));

figure(2)
plot(real(w),imag(w));
title('AB-2 Stability Region') 

%% Part D %%
clear
N = 10000;
Omega=linspace(0,2*pi,N+1); 
z=exp(1i*Omega); 

for T = 0.1:0.1:1
    w = T*((2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4)).*(2*z.*(z-1)./(3*z-1));
    hold on
    figure(3)
    plot(real(w),imag(w))
    legend('T=0.1','T=0.2','T=0.3','T=0.4','T=0.5','T=0.6','T=0.7','T=0.8','T=0.9','T=1.0')
    title('\lambdaT Stability Regions for Different Sample Times')
    hold off
end

%% Part F %%
clear
N = 10000;
t = linspace(0,10,N);
T_unstable = 1.0;
T_stable = 0.1;
u = ones(1,N);
y1 = zeros(N);
y2 = zeros(N);

for k = 4:N-4
    f1(k) = -2.9362*y1(k+4)+7.7068*y1(k+3)+8.3393*y1(k+2)-4.4174*y1(k)+0.08507*u(k+4);
    y1(k+2) = y1(k+1) + (T_unstable/2)*(3*y1(k+1)-y1(k));
end

for k = 4:N-4
    f2(k) = -2.9362*y2(k+4)+7.7068*y2(k+3)+8.3393*y2(k+2)-4.4174*y2(k)+0.08507*u(k+4);
    y2(k+2) = y2(k+1) + (T_stable/2)*(3*y2(k+1)-y2(k));
end

figure(4)
plot(y1)


