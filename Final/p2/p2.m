% System Simuation Final: Problem 2
% Written by Josh Humphrey

clear
N = 10000;
T = 0.1;
period = 10;
t = linspace(0,period,N);
x_Hartley = zeros(0,N);
y_Hartley = zeros(0,N);
z_Hartley = zeros(0,N);
x_Chua = zeros(0,N);
y_Chua = zeros(0,N);
z_Chua = zeros(0,N);
% Initial Conditions and Declarations
alpha = 10;
x_Hartley(1) = sqrt(2)/10;
x_Chua(1) = sqrt(2)/10;
y_Hartley(1) = 0;
y_Chua(1) = 0;
z_Hartley(1) = -sqrt(2)/10;
z_Chua(1) = -sqrt(2)/10;

% Simulate Hartley's System:
for k = 1:(N-1)
    XK1 = alpha*(y_Hartley(k)+((x_Hartley(k)-2*(x_Hartley(k).^3))/7));
    YK1 = x_Hartley(k)-y_Hartley(k)+z_Hartley(k);
    ZK1 = (-100/7)*y_Hartley(k);
    
    MidX1 = x_Hartley(k)+(T/2)*XK1;
    MidY1 = y_Hartley(k)+(T/2)*YK1;
    MidZ1 = z_Hartley(k)+(T/2)*ZK1;
    
    XK2 = alpha*(MidY1+((MidX1-2*(MidX1.^3))/7));
    YK2 = MidX1-MidY1+MidZ1;
    ZK2 = (-100/7)*MidY1;
    
    MidX2 = x_Hartley(k)+(T/2)*XK2;
    MidY2 = y_Hartley(k)+(T/2)*YK2;
    MidZ2 = z_Hartley(k)+(T/2)*ZK2;
    
    XK3 = alpha*(MidY2+((MidX2-2*(MidX2.^3))/7));
    YK3 = MidX2-MidY2+MidZ2;
    ZK3 = (-100/7)*MidY2;
    
    MidX3 = x_Hartley(k)+(T)*XK3;
    MidY3 = y_Hartley(k)+(T)*YK3;
    MidZ3 = z_Hartley(k)+(T)*ZK3;
    
    XK4 = alpha*(MidY3+((MidX3-2*(MidX3.^3))/7));
    YK4 = MidX3-MidY3+MidZ3;
    ZK4 = (-100/7)*MidY3;
    
    x_Hartley(k+1) = x_Hartley(k)+(T/6)*(XK1+2*XK2+2*XK3+XK4);
    y_Hartley(k+1) = y_Hartley(k)+(T/6)*(YK1+2*YK2+2*YK3+YK4);
    z_Hartley(k+1) = z_Hartley(k)+(T/6)*(ZK1+2*ZK2+2*ZK3+ZK4);
end

figure(1)
plot3(x_Hartley,y_Hartley,z_Hartley)
title('Hartley-Chua System')

% Simulate Chua's System:
for k = 1:(N-1)
    XK1 = alpha*(y_Chua(k)-g(x_Chua(k)));
    YK1 = x_Chua(k)-y_Chua(k)+z_Chua(k);
    ZK1 = (-100/7)*y_Chua(k);
    
    MidX1 = x_Chua(k)+(T/2)*XK1;
    MidY1 = y_Chua(k)+(T/2)*YK1;
    MidZ1 = z_Chua(k)+(T/2)*ZK1;
    
    XK2 = alpha*(MidY1-g(MidX1));
    YK2 = MidX1-MidY1+MidZ1;
    ZK2 = (-100/7)*MidY1;
    
    MidX2 = x_Chua(k)+(T/2)*XK2;
    MidY2 = y_Chua(k)+(T/2)*YK2;
    MidZ2 = z_Chua(k)+(T/2)*ZK2;
    
    XK3 = alpha*(MidY2-g(MidX2));
    YK3 = MidX2-MidY2+MidZ2;
    ZK3 = (-100/7)*MidY2;
    
    MidX3 = x_Chua(k)+(T)*XK3;
    MidY3 = y_Chua(k)+(T)*YK3;
    MidZ3 = z_Chua(k)+(T)*ZK3;
    
    XK4 = alpha*(MidY3-g(MidX3));
    YK4 = MidX3-MidY3+MidZ3;
    ZK4 = (-100/7)*MidY3;
    
    x_Chua(k+1) = x_Chua(k)+(T/6)*(XK1+2*XK2+2*XK3+XK4);
    y_Chua(k+1) = y_Chua(k)+(T/6)*(YK1+2*YK2+2*YK3+YK4);
    z_Chua(k+1) = z_Chua(k)+(T/6)*(ZK1+2*ZK2+2*ZK3+ZK4);
end

figure(2)
plot3(x_Chua,y_Chua,z_Chua)
title('Chua System')

% figure(3)
% grid on
% hold on
% plot(t,x_Hartley)
% plot(t,x_Chua)
% title('Hartley vs. Chua: X Values')
% legend('Hartley','Chua')
% hold off
% 
% figure(4)
% grid on
% hold on
% plot(t,y_Hartley)
% plot(t,y_Chua)
% title('Hartley vs. Chua: Y Values')
% legend('Hartley','Chua')
% hold off
% 
% figure(5)
% grid on
% hold on
% plot(t,z_Hartley)
% plot(t,z_Chua)
% title('Hartley vs. Chua: Z Values')
% legend('Hartley','Chua')
% hold off