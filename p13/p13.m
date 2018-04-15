% System Simulation Problem 13
% Written by Josh Humphrey

N = 100;
s = linspace(0,10,N);

num = 0.6042*s.^4+4.1572*s.^2+6.1591;
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

% Predictor-Corrector Sim
N = 100;
T_stable = 0.1;
T_unstable = 1.5;

t = linspace(0,10,N);
fx1c = zeros(1,N);
fx2c = zeros(1,N);
fx3c = zeros(1,N);
fx4c = zeros(1,N);
fx5c = zeros(1,N);

x1p = zeros(1,N);
x2p = zeros(1,N);
x3p = zeros(1,N);
x4p = zeros(1,N);
x5p = zeros(1,N);

fx1p = zeros(1,N);
fx2p = zeros(1,N);
fx3p = zeros(1,N);
fx4p = zeros(1,N);
fx5p = zeros(1,N);

x1c = zeros(1,N);
x2c = zeros(1,N);
x3c = zeros(1,N);
x4c = zeros(1,N);
x5c = zeros(1,N);

y = zeros(1,N);
u = ones(1,N);

% Initial Conditions
x1c(1) = 1;
x2c(1) = 1;
x3c(1) = 1;
x4c(1) = 1;
x5c(1) = 1;

x1p(1) = 1;
x2p(1) = 1;
x3p(1) = 1;
x4p(1) = 1;
x5p(1) = 1;

for k = 1:N-1
    % Evaluate for prediction %
    fx1c(k) = -3.463*x1c(k)-7.1705*x2c(k)-10.2787*x3c(k)-8.6926*x4c(k)-6.1590*x5c(k)+u(k);
    fx2c(k) = x1c(k);
    fx3c(k) = x2c(k);
    fx4c(k) = x3c(k);
    fx5c(k) = x4c(k);
    
    % Predict %
    x1p(k+1) = x1c(k)+T_stable*fx1c(k);
    x2p(k+1) = x2c(k)+T_stable*fx2c(k);
    x3p(k+1) = x3c(k)+T_stable*fx3c(k);
    x4p(k+1) = x4c(k)+T_stable*fx4c(k);
    x5p(k+1) = x5c(k)+T_stable*fx5c(k);
    
    % Evaluate for correction %
    fx1p(k+1) = -3.463*x1p(k+1)-7.1705*x2p(k+1)-10.2787*x3p(k+1)-8.6926*x4p(k+1)-6.1590*x5p(k+1)+u(k);
    fx2p(k+1) = x1p(k+1);
    fx3p(k+1) = x2p(k+1);
    fx4p(k+1) = x3p(k+1);
    fx5p(k+1) = x4p(k+1);
    
    % Correct %
    x1c(k+1) = x1c(k)+T_stable*fx1p(k+1);
    x2c(k+1) = x2c(k)+T_stable*fx2p(k+1);
    x3c(k+1) = x3c(k)+T_stable*fx3p(k+1);
    x4c(k+1) = x4c(k)+T_stable*fx4p(k+1);
    x5c(k+1) = x5c(k)+T_stable*fx5p(k+1);
    
    % Output %
    y(k+1) = 0.6042*x1c(k+1)+4.1572*x3c(k+1)+x5c(k+1);
end

figure(2)
plot(t,y)
title('Predictor-Corrector Simulation: Stable')
xlabel('Time (Seconds)')
ylabel('Magnitude')

% Unstable T
fx1c = zeros(1,N);
fx2c = zeros(1,N);
fx3c = zeros(1,N);
fx4c = zeros(1,N);
fx5c = zeros(1,N);

x1p = zeros(1,N);
x2p = zeros(1,N);
x3p = zeros(1,N);
x4p = zeros(1,N);
x5p = zeros(1,N);

fx1p = zeros(1,N);
fx2p = zeros(1,N);
fx3p = zeros(1,N);
fx4p = zeros(1,N);
fx5p = zeros(1,N);

x1c = zeros(1,N);
x2c = zeros(1,N);
x3c = zeros(1,N);
x4c = zeros(1,N);
x5c = zeros(1,N);

y = zeros(1,N);
u = ones(1,N);

% Initial Conditions
x1c(1) = 1;
x2c(1) = 1;
x3c(1) = 1;
x4c(1) = 1;
x5c(1) = 1;

x1p(1) = 1;
x2p(1) = 1;
x3p(1) = 1;
x4p(1) = 1;
x5p(1) = 1;

for k = 1:N-1
    % Evaluate for prediction %
    fx1c(k) = -3.463*x1c(k)-7.1705*x2c(k)-10.2787*x3c(k)-8.6926*x4c(k)-6.1590*x5c(k)+u(k);
    fx2c(k) = x1c(k);
    fx3c(k) = x2c(k);
    fx4c(k) = x3c(k);
    fx5c(k) = x4c(k);
    
    % Predict %
    x1p(k+1) = x1c(k)+T_unstable*fx1c(k);
    x2p(k+1) = x2c(k)+T_unstable*fx2c(k);
    x3p(k+1) = x3c(k)+T_unstable*fx3c(k);
    x4p(k+1) = x4c(k)+T_unstable*fx4c(k);
    x5p(k+1) = x5c(k)+T_unstable*fx5c(k);
    
    % Evaluate for correction %
    fx1p(k+1) = -3.463*x1p(k+1)-7.1705*x2p(k+1)-10.2787*x3p(k+1)-8.6926*x4p(k+1)-6.1590*x5p(k+1)+u(k);
    fx2p(k+1) = x1p(k+1);
    fx3p(k+1) = x2p(k+1);
    fx4p(k+1) = x3p(k+1);
    fx5p(k+1) = x4p(k+1);
    
    % Correct %
    x1c(k+1) = x1c(k)+T_unstable*fx1p(k+1);
    x2c(k+1) = x2c(k)+T_unstable*fx2p(k+1);
    x3c(k+1) = x3c(k)+T_unstable*fx3p(k+1);
    x4c(k+1) = x4c(k)+T_unstable*fx4p(k+1);
    x5c(k+1) = x5c(k)+T_unstable*fx5p(k+1);
    
    % Output %
    y(k+1) = 0.6042*x1c(k+1)+4.1572*x3c(k+1)+x5c(k+1);
end

figure(3)
plot(t,y)
title('Predictor-Corrector Simulation: Unstable')
xlabel('Time (Seconds)')
ylabel('Magnitude')
