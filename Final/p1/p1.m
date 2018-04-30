% System Simuation Final: Problem 1
% Written by Josh Humphrey

clear
N = 1000;
positions = 10;
T = 0.1;
t = linspace(1,10,N);
x = zeros(1,N);
ffx = zeros(1,positions);

% Initialize x(m) values
for j = 1:(positions)
   x(j) = j;
end
for i = 2:positions-1
    ffx(i) = -1+(1/((x(i)-x(i-1)).^2))-(1/((x(i+1)-x(i)).^2)); 
end

% Plot All Magnets
figure(1)
grid on
hold on

for magnet = 1:positions
    for k = 2:N-1
        x(k+1) = -2*x(k)-x(k-1)-T^2*(ffx(magnet));
    end
    plot(t,x)
    
end

title('Magnets on a Frictionless Rod')
xlabel('Time (seconds)')
ylabel('Position')
hold off

