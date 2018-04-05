% Midterm Exam: System Simulation
% Written by Josh Humphrey
% Problem 2

% Plot the Stability Region:
lambda = 1;
T = 1;

LT = lambda*T;

b0 = (6/17);
b1 = (11/17);
b2 = (3/2);

N = 1000;
theta = linspace(0,2*pi,N+1);
z = exp(1i*theta);

w = (z.^2-z)./(b2*z.^2+b1*z+b0);

figure(1)
plot(real(w),imag(w))
title('\lambdaT Plane Stability Region for Predictor')

