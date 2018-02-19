% Problem 6 System Simulation Homework
% Written by Josh Humphrey
T = 0.01;
N = 10000001;

a = 0.2;
b = 0.2;
c = 4;
x(1) = 5;
y(1) = 5;
z(1) = 10;

% Part A1
period = 1;
t = linspace(0,period,N);
x = linspace(0,period,N);
y = linspace(0,period,N);
z = linspace(0,period,N);

for t = 2:N-1
   fx(t) = (-y(t)-z(t));
   fy(t) = x(t)+a*y(t);
   fz(t) = b+z(t)*(x(t)-c);
   
   x(t+1) = x(t) + (3*T)./(2)*fx(t)-(T/2)*fx(t-1);
   y(t+1) = y(t) + (3*T)./(2)*fy(t)-(T/2)*fy(t-1);
   z(t+1) = z(t) + (3*T)./(2)*fz(t)-(T/2)*fz(t-1);

end
figure(1)
plot(x(5000000:N),y(5000000:N))
title('x vs. y with a period of 1')

