lambda = -10;
T = 0.5;

LT = lambda*T;
A = [1 0 -LT 0; 0 1 0 -LT; 1 1 0 0; 0 1 -1 -1];
B = [0; -exp(LT); -1; -2];
x = A\B;

a0 = x(1);
a1 = x(2);
b0 = x(3);
b1 = x(4);

num = [b1 b0];
den = [1 a1 a0];

zeros = roots(num);
poles = roots(den);

theta = linspace(0,2*pi,1001);
z = exp(1i*theta);

w = (z.^2+a1*z+a0)./(b1*z+b0);

figure(1)
plot(real(w),imag(w))
title('\lambdaT Plane Stability Region')

