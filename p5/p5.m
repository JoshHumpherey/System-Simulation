% System Simulation Problem 5
% Written by Josh Humphrey
N = 10000;
T = 0.01;
t = linspace(0,10,N+1);
u1 = ones(1,N);
u2 = ones(1,N);

x1 = zeros(1,N);
x2 = x1;
x3 = x1;
x4 = x1;
f1 = x1;
f2 = x1;
f3 = x1;
f4 = x1;
y1 = x1;
y2 = x1;

for k = 1:N
    f1(k) = -x1(k)-2*u1(1,k);
    x1(k+1)=-x1(k)-2*u1(k)+T*f1(k);
    
    f2(k) = -x2(k)+4*u1(1,k);
    x2(k+1) = -x2(k)+4*u1(1,k)+T*f2(k);
    
    f3(k) = -x3(k)+3*u2(1,k);
    x3(k+1) = -x3(k)+3*u2(1,k)+T*f3(k);
    
    f4(k) = -x4(k)-6*u2(1,k);
    x4(k+1) = -x4(k)-6*u2(1,k)+T*f4(k);
    
    y1(k+1) = x1(k+1)+x3(k+1);
    y2(k+1) = x2(k+1)+x4(k+1)+8*u2(1,k);
end

figure(1)
plot(y1,t)
xlim([0,10])
xlabel('time')
ylabel('magnitude')
title('C1')

figure(2)
plot(y2,t)
xlim([0,10])
xlabel('time')
ylabel('magnitude')
title('C2')