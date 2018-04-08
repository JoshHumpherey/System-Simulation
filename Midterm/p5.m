% Midterm Exam: System Simulation
% Written by Josh Humphrey
% Problem 5

b0 = (15/289);
b1 = (229/578);
b2 = (319/578);
N = 10000;
theta = linspace(0,2*pi,N+1);
z = radius1;
w = (z.^2-z)./(b2*z.^2+b1*z+b0);
den_GC = [1 6.5 14.4 12];
poles_Gc = roots(den_GC)

p1_xval = -3.1115;
p1_yval = 0;
p2_xval = -1.6943;
p2_yval = 0.9931;
p3_xval = -1.6943;
p3_yval = -0.9931;
T = linspace(0,1,10);

figure(1)
hold on
plot(real(w),imag(w))
T = 0.2
plot(T*p1_xval,T*p1_yval,'x')
plot(T*p2_xval,T*p2_yval,'x')
plot(T*p3_xval,T*p3_yval,'x')

T = 1.0
plot(T*p1_xval,T*p1_yval,'x')
plot(T*p2_xval,T*p2_yval,'x')
plot(T*p3_xval,T*p3_yval,'x')
% for k = 1:10
%     title(['Predictor Stability Region; T=',num2str(T(k))])
%     plot(T(k)*p1_xval,T(k)*p1_yval,'x')
%     plot(T(k)*p2_xval,T(k)*p2_yval,'x')
%     plot(T(k)*p3_xval,T(k)*p3_yval,'x')
%     pause(1)
% end
title('\lambdaT Plane Stability Region with Gc(s) Poles')
hold  off

num = [1 1];
den = den_GC;
[A,B,C,D] = tf2ss(num,den);
t = linspace(0,10,N);

% Stable Simulation
N = 10000;
T_stable = 0.1;
xlow = 0;
xhigh = 0.1;
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

figure(2)
plot(t,y)
xlim([xlow xhigh])
title('Simulation of Gc(s): Stable T')
ylabel('Magnitude')
xlabel('Time (seconds)')

% Unstable Simulation
clear
xlow = 0.9;
xhigh = 1;
N = 10000;
T_unstable = 1.0;
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
    
    x1(k+1) = x1(k) + T_unstable*fx1(k);
    x2(k+1) = x2(k) + T_unstable*fx2(k);
    x3(k+1) = x3(k) + T_unstable*fx3(k);

    y(k) = x2(k)+x3(k);
end

figure(3)
plot(t,y)
xlim([xlow xhigh])
title('Simulation of Gc(s): Unstable T')
ylabel('Magnitude')
xlabel('Time (seconds)')