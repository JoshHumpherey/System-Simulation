% Problem 7: Written by Josh Humphrey
N = 10000001;
t = linspace(0,15,N+1);
T = 0.0001;

x = zeros(1,N);
y = zeros(1,N);
z = zeros(1,N);

fx = zeros(1,N);
fy = zeros(1,N);
fz = zeros(1,N);

x(1) = 1;
y(1) = 2;
z(1) = 10;

for k = 1:N-5
    fx(k+3)= 10*(y(k)-x(k));
    fy(k+3)= -x(k)*z(k)+28*x(k)-y(k);
    fz(k+3)=  x(k)*y(k)-(8/3)*z(k);
    
    x(k+4)= x(k+3)+ (T./24)*(55*fx(k+3)-59*fx(k+2)+37*fx(k+1)-9*fx(k));
    y(k+4)= y(k+3)+ (T./24)*(55*fy(k+3)-59*fy(k+2)+37*fy(k+1)-9*fy(k));
    z(k+4)= z(k+3)+ (T./24)*(55*fz(k+3)-59*fz(k+2)+37*fz(k+1)-9*fz(k));
end

figure(1)
plot3(x,y,z)
title('AB-4 Simulation of the Lorenz System')
