% System Simulation Problem 1
% Written by Josh Humphrey
% Due to matlab indexing of 1 all values should be shifted LEFT by one

alpha = [0.80;1.35;2.75;3.20;3.52;3.8;4.0];
k = linspace(1,100);
x = zeros(100);
i = 1;
x(1) = 0.11;

hold on
for j = 1:7
    alphaVal = alpha(j);
    for i = 2:100
        currentIndex = k(i);
        lastIndex = k(i-1);
        x(currentIndex) = alphaVal*(1-x(lastIndex))*x(lastIndex);
    end
plot(k, x(k))
xlabel('k')
ylabel('x(k)')
title('x(k) Simulation for Different Gains')
legend('a=0.80','a=1.35','a=2.75','a=3.20','a=3.52','a=3.8','a=4.0')
end
hold off
