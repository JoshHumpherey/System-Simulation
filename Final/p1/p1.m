% System Simuation Final: Problem 1
% Written by Josh Humphrey

clear
N = 11;
T = 1;
t = linspace(1,N,N);
x = ones(1,N);
x(1) = 0;
x(11) = 10;
ffx = zeros(1,N);

figure(1)
hold on
grid on
for m = 3:9
    ffx(m) = -1+(1/((x(m)-x(m-1)).^2))-(1/((x(m+1)-x(m)).^2));
    x(m) = (T^2)*ffx(m-1)-x(m-2)-2*x(m-1);
    plot(t,x(m),'o')
end

title('Magnets on a Frictionless Rod')
xlabel('Time (seconds)')
ylabel('Position')
hold off

