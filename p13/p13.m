% System Simulation Problem 13
% Written by Josh Humphrey

N = 100;
s = linspace(0,10,N);

num = 0.6042*s.^2+4.1572*s.^2+6.1591;
den = s.^5+3.4630*s.^4+7.1704*s.^3+10.2787*s.^2+8.6926*s+6.159;
sys = tf(num,den);

[z,p,k] = zpkdata(sys);

clear
N = 10000;
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
s=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H = (0.6042*s.^2+4.1572*s.^2+6.1591)./(s.^5+3.4630*s.^4+7.1704*s.^3+10.2787*s.^2+8.6926*s+6.159);
       
figure (1)
subplot(2,1,1)
plot(Omega,abs(H));
title('Frequency Response (Magnitude)')
        
subplot(2,1,2)
plot(Omega,angle(H));
title('Frequency Response (Angle)')

