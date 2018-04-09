% Midterm Exam: System Simulation
% Written by Josh Humphrey
% Problem 6

N = 10000;
T = 0.2;
t = linspace(0,10,N);
fx1c = zeros(1,N);
fx2c = zeros(1,N);
fx3c = zeros(1,N);

x1p = zeros(1,N);
x2p = zeros(1,N);
x3p = zeros(1,N);

fx1p = zeros(1,N);
fx2p = zeros(1,N);
fx3p = zeros(1,N);

x1c = zeros(1,N);
x2c = zeros(1,N);
x3c = zeros(1,N);

y = zeros(1,N);
u = ones(1,N);

% Initial Conditions
x1c(1) = 1;
x2c(1) = 1;
x3c(1) = 1;
x1p(1) = 1;
x2p(1) = 1;
x3p(1) = 1;

for k = 1:N-1
    % Evaluate for prediction %
    fx1c(k) = -6.5*x1c(k)-14.4*x2c(k)-12*x3c(k)+u(k);
    fx2c(k) = x1c(k);
    fx3c(k) = x2c(k);
    % Predict %
    x1p(k+1) = x1c(k)+T*fx1c(k);
    x2p(k+1) = x2c(k)+T*fx2c(k);
    x3p(k+1) = x3c(k)+T*fx3c(k);
    % Evaluate for correction %
    fx1p(k+1) = -6.5*x1p(k+1)-14.4*x2p(k+1)-12*x3p(k+1)+u(k+1);
    fx2p(k+1) = x1p(k+1);
    fx3p(k+1) = x2p(k+1);
    % Correct %
    x1c(k+1) = x1c(k)+T*fx1p(k+1);
    x2c(k+1) = x2c(k)+T*fx2p(k+1);
    x3c(k+1) = x3c(k)+T*fx3p(k+1);
    
    % Output %
    y(k+1) = x2c(k+1)+x3c(k+1);
end

plot(t,y)
title('Predictor-Corrector Simulation')
xlabel('Time (Seconds)')
ylabel('Magnitude')
