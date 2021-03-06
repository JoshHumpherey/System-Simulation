% System Simulation Problem 4
% Written by Josh Humphrey

N = 10000
T = 0.01;
period = 10;
k = linspace(0,period,N);

for k = 1:N
    c1(k) = -2*exp(-k)+3*exp(-k);
    c2(k) = 4*exp(-k)*1-6*exp(-k);
end

figure(1)
plot(c1)
title('C1')
xlim([0,10])
xlabel('time')
ylabel('magnitude')

figure(2)
plot(c2)
title('C2')
xlim([0,10])
xlabel('time')
ylabel('magnitude')
