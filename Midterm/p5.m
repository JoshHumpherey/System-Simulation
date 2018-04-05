% Midterm Exam: System Simulation
% Written by Josh Humphrey
% Problem 5

clear
b0 = (6/17);
b1 = (11/17);
b2 = (3/2);
N = 10000;
theta = linspace(0,2*pi,N+1);
z = exp(1i*theta);
w = (z.^2-z)./(b2*z.^2+b1*z+b0);
den_GC = [1 6.5 14.4 12];
poles_Gc = roots(den_GC)

figure(2)
hold on
plot(real(w),imag(w))
plot(-3.1115,0,'x')
plot(-1.6943,0.9931,'x')
plot(-1.6943,-0.9931,'x')
title('\lambdaT Plane Stability Region with Gc(s) Poles')

T_stable = 0.01;
T_unstable = 1.0;

num = [1 1];
den = den_GC;
[A,B,C,D] = tf2ss(num,den);
t = linspace(0,10,N);

u = ones(1,N);
fx1 = zeros(1,N);
fx2 = zeros(1,N);
fx3 = zeros(1,N);
x1 = zeros(1,N);
x2 = zeros(1,N);
x3 = zeros(1,N);
y = zeros(1,N);

for k = 1:N-1
    fx1(k) = -6.5*x1(k)-14.4*x2(k)-12*x3(k)+u(k);
    fx2(k) = x1(k);
    fx3(k) = x2(k);
    
    x1(k+1) = x1(k) + T_stable*fx1(k);
    x2(k+1) = x2(k) + T_stable*fx2(k);
    x3(k+1) = x3(k) + T_stable*fx3(k);

    y(k) = x2(k)+x3(k);
end

figure(3)
plot(t,y)
title('Simulation of Gc(s)')
ylabel('Magnitude')
xlabel('Time (seconds)')