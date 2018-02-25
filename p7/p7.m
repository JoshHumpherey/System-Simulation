% Problem 7: Written by Josh Humphrey
N = 10000;
period = 1;
R = 28;
fx = linspace(1,period,N);
fy = linspace(1,period,N);
fz = linspace(1,period,N);
k = linspace(1,period,N);
x = linspace(1,period,N);
y = linspace(1,period,N);
z = linspace(1,period,N);
x(1) = 1;
y(1) = 2;
z(1) = 10;

for k = 1:N-4
    fx(k) = 10*(y(k)-x(k));
    fy(k) = -x(k)*z(k)+R*x(k)-y(k);
    fz(k) = x(k)*y(k)-(8/3)*z(k);
    
    x(k+3)= x(k+2)+((23/12)*fx(k+2)-(4/3)*fx(k+1)+(5/12)*fx(k));
    y(k+3)= y(k+2)+((23/12)*fy(k+2)-(4/3)*fy(k+1)+(5/12)*fy(k));
    z(k+3)= z(k+2)+((23/12)*fz(k+2)-(4/3)*fz(k+1)+(5/12)*fz(k));
end

plot3(x,y,z)
title('AB-4 Simulation of the Lorenz System')
