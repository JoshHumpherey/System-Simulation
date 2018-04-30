% System Simuation Final: Problem 1
% Written by Josh Humphrey

clear
N = 10;
T = 1;
t = linspace(1,N+1,N+1);
x = zeros(1,N+1);
y = zeros(1,N+1);
x(1) = 0;
x(11) = 10;
ffx = zeros(1,N+1);

for m = 3:9
    ffx(m) = -1+(1/(x(m)-x(m-1)).^2)-(1/(x(m+1)-x(m)).^2);
    y(m) = T.^2*(ffx(m-1))-y(m-2)-2*y(m-1);
end

figure(1)
plot(t,y,'o')
title('Magnets on a Frictionless Rod')
xlabel('Time (Seconds)')
ylabel('Position')