% System Simuation Final: Problem 4
% Written by Josh Humphrey
clear
N = 100000;
T = 0.01;
t = linspace(0,1000,N);
x1 = zeros(1,N);
x2 = zeros(1,N);
x3 = zeros(1,N);

x1(1) = 0.1;
x2(1) = 0.1;
x3(1) = 0.1;

for k = 1:(N-1)
    X1_K1 = -0.04*x1(k)+(10^4)*x2(k)*x3(k);
    X2_K1 = 0.04*x1(k)-(10^4)*x2(k)*x3(k)-(3*10^7)*(x2(k))^2;
    X3_K1 = (3*10^7)*(x2(k))^2;
    
    MidX1_1 = x1(k)+(T/2)*X1_K1;
    MidX2_1 = x2(k)+(T/2)*X2_K1;
    MidX3_1 = x3(k)+(T/2)*X3_K1;
    
    X1_K2 = -0.04*MidX1_1+(10^4)*MidX2_1*MidX3_1;
    X2_K2 = 0.04*MidX1_1-(10^4)*MidX2_1*MidX3_1-(3*10^7)*(MidX2_1)^2;
    X3_K2 = (3*10^7)*(MidX2_1)^2;
    
    MidX1_2 = x1(k)+(T/2)*X1_K2;
    MidX2_2 = x2(k)+(T/2)*X2_K2;
    MidX3_2 = x3(k)+(T/2)*X3_K2;
    
    X1_K3 = -0.04*MidX1_2+(10^4)*MidX2_2*MidX3_2;
    X2_K3 = 0.04*MidX1_2-(10^4)*MidX2_2*MidX3_2-(3*10^7)*(MidX2_2)^2;
    X3_K3 = (3*10^7)*(MidX2_2)^2;
    
    MidX1_3 = x1(k)+(T)*X1_K3;
    MidX2_3 = x2(k)+(T)*X2_K3;
    MidX3_3 = x3(k)+(T)*X3_K3;
    
    X1_K4 = -0.04*MidX1_3+(10^4)*MidX2_3*MidX3_3;
    X2_K4 = 0.04*MidX1_3-(10^4)*MidX2_3*MidX3_3-(3*10^7)*(MidX2_3)^2;
    X3_K4 = (3*10^7)*(MidX2_3)^2;
    
    x1(k+1) = x1(k)+(T/6)*(X1_K1 + 2*X1_K2 + 2*X1_K3 + X1_K4);
    x2(k+1) = x2(k)+(T/6)*(X2_K1 + 2*X2_K2 + 2*X2_K3 + X2_K4);
    x3(k+1) = x3(k)+(T/6)*(X3_K1 + 2*X3_K2 + 2*X3_K3 + X3_K4);
end

figure(1)
grid on
hold on
plot(t,x1)
plot(t,x2)
plot(t,x3)
title('Problem 4')
legend('x1','x2','x3')