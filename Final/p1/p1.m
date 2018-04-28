% System Simuation Final: Problem 1
% Written by Josh Humphrey
clear
N = 10;
T = 1;
t = linspace(1,11,11);
x = zeros(0,N);
x(1) = 0;
x(11) = 10;
ffx = zeros(0,N);

for m = 3:9
    ffx(m) = -1+(1/(x(m)-x(m-1)).^2)-(1/(x(m+1)-x(m)).^2);
    x(m) = (T^2)*ffx(m-1)-x(m-2)-2*x(m-1);
    
end

figure(1)
plot(t,x,'o')
title('Magnets on a Frictionless Rod')
xlabel('Time (seconds)')
ylabel('Position')