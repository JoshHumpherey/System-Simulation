% System Simuation Final: Problem 1
% Written by Josh Humphrey

clear
N = 10000;
positions = 10;
T = 0.1;
t = linspace(0,10,N);
x0 = zeros(1,N);
x1 = zeros(1,N);
x2 = zeros(1,N);
x3 = zeros(1,N);
x4 = zeros(1,N);
x5 = zeros(1,N);
x6 = zeros(1,N);
x7 = zeros(1,N);
x8 = zeros(1,N);
x9 = zeros(1,N);
x10 = 10*ones(1,N);
f1 = zeros(1,N);
% Initialize x(m) values
x1(1) = 1;
x2(1) = 2;
x3(1) = 3;
x4(1) = 4;
x5(1) = 5;
x6(1) = 6;
x7(1) = 7;
x8(1) = 8;
x9(1) = 9;

% Plot All Magnets
figure(1)
grid on
hold on

for k = 2:N-1
    f1(k) = -1+1/(x1(k)-x0(k))^2-1/(x2(k)-x1(k))^2;
    x1(k+1) = -2*x1(k)-x1(k-1)-T^2*(f1);
end
plot(t,x1)

for k = 2:N-1
    f2 = -1+1/(x2(k)-x1(k))^2-1/(x3(k)-x2(k))^2;
    x2(k+1) = -2*x2(k)-x2(k-1)-T^2*(f2);
end
plot(t,x2)

for k = 2:N-1
    f3 = -1+1/(x3(k)-x2(k))^2-1/(x4(k)-x3(k))^2;
    x3(k+1) = -2*x3(k)-x3(k-1)-T^2*(f3);
end
plot(t,x3)

for k = 2:N-1
    f4 = -1+1/(x4(k)-x3(k))^2-1/(x5(k)-x4(k))^2;
    x4(k+1) = -2*x4(k)-x4(k-1)-T^2*(f4);
end
plot(t,x4)

for k = 2:N-1
    f5 = -1+1/(x5(k)-x4(k))^2-1/(x6(k)-x5(k))^2;
    x5(k+1) = -2*x5(k)-x5(k-1)-T^2*(f5);
end
plot(t,x5)

for k = 2:N-1
    f6 = -1+1/(x6(k)-x5(k))^2-1/(x7(k)-x6(k))^2;
    x6(k+1) = -2*x6(k)-x6(k-1)-T^2*(f6);
end
plot(t,x6)

for k = 2:N-1
    f7 = -1+1/(x7(k)-x6(k))^2-1/(x8(k)-x7(k))^2;
    x7(k+1) = -2*x7(k)-x7(k-1)-T^2*(f7);
end
plot(t,x7)

for k = 2:N-1
    f8 = -1+1/(x8(k)-x7(k))^2-1/(x9(k)-x8(k))^2;
    x8(k+1) = -2*x8(k)-x8(k-1)-T^2*(f8);
end
plot(t,x8)

for k = 2:N-1
    f9 = -1+1/(x9(k)-x8(k))^2-1/(x10(k)-x9(k))^2;
    x9(k+1) = -2*x9(k)-x9(k-1)-T^2*(f9);
end
plot(t,x9)
plot(t,x10)
title('Magnets on a Frictionless Rod')
xlabel('Time (seconds)')
ylabel('Position')
hold off

