% Problem 6 System Simulation Homework
% Written by Josh Humphrey
T = 0.01;
N = 100;

a = 0.2;
b = 0.2;
c = 5.7;
x(1) = 5;
y(1) = 5;
z(1) = 10;

% Part A1
period = 1;
t = linspace(0,period,N);
x = linspace(0,period,N);
y = linspace(0,period,N);
z = linspace(0,period,N);

for t = 1:N-1
   x(t+1) = (-y(t)-z(t));
   y(t+1) = x(t)+a*y(t);
   z(t+1) = b+z(t)*(x(t)-c);
end
figure(1)
plot(x,y)
title('x vs. y with a period of 1')

% Part A2
period = 2;
t = linspace(0,period,N);
x = linspace(0,period,N);
y = linspace(0,period,N);
z = linspace(0,period,N);

for t = 1:N-1
   x(t+1) = (-y(t)-z(t));
   y(t+1) = x(t)+a*y(t);
   z(t+1) = b+z(t)*(x(t)-c);
end
figure(2)
plot(x,y)
title('x vs. y with a period of 2')

% Part A3
period = 3;
t = linspace(0,period,N);
x = linspace(0,period,N);
y = linspace(0,period,N);
z = linspace(0,period,N);

for t = 1:N-1
   x(t+1) = (-y(t)-z(t));
   y(t+1) = x(t)+a*y(t);
   z(t+1) = b+z(t)*(x(t)-c);
end
figure(3)
plot(x,y)
title('x vs. y with a period of 3')

% Part B
a = 0.3;
b = 0.3;
c = 8.0;

period = 3;
t = linspace(0,period,N);
x = linspace(0,period,N);
y = linspace(0,period,N);
z = linspace(0,period,N);

for t = 1:N-1
   x(t+1) = (-y(t)-z(t));
   y(t+1) = x(t)+a*y(t);
   z(t+1) = b+z(t)*(x(t)-c);
end
plot3(x,y,z)
title('3D plot of X,Y,Z')