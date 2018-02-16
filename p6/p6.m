% Problem 6 System Simulation Homework
% Written by Josh Humphrey
T = 0.01;
N = 100;
period = 1;
t = linspace(0,period,N);
x = linspace(0,period,N);
y = linspace(0,period,N);
z = linspace(0,period,N);
a = 0.2;
b = 0.2;
c = 5.7;
x(1) = 5;
y(1) = 5;
z(1) = 10;

xdot = -y-z;
zdot = b+z.*(x-c);

for t = 1:N-1
   x(t+1) = x(t)+(-y(t)-z(t));
   y(t+1) = y(t)+(x(t)+a.*y(t));
   z(t+1) = z(t)+(b+z(t).*(x(t)-c));
    
end

plot(x,y)