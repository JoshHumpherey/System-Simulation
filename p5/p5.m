% System Simulation Problem 5
% Written by Josh Humphrey
N = 10000;
T = 0.01;
t = linspace(0,10,N);
u1 = ones(1,N+1);
u2 = ones(1,N+1);

x1_dot = @(t) -x1(t)-2*u1(t);
x2_dot = @(t) -x2(t) + 4*u1(t);
x3_dot = @(t) -x3(t) + 3*u2(t);
x4_dot = @(t) -x4(t)+x3(t);

y1 = @(t) x1(t)+x3(t);
y2 = @(t) x2(t)+x4(t)+8*u2(t);