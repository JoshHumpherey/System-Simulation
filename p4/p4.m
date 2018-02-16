% System Simulation Problem 4
% Written by Josh Humphrey

N = 1000
z = linspace(0,100,N);
T = 0.01;
z1 = ones(1,N+1);
z2 = ones(1,N+1);
s = ((z-1)/(T*z));
C1 = @(t) (3*100.^(t)*101.^(-t-1))*z1(1,t)+(-2.^(2*t+1)*25.^(t)*101.^(-t-1))*z2(1,t);
C2 = @(t) (4.^(t+1)*25.^(t)*101.^(-t-1))*z1(1,t)+(7.94059*heaviside(t)-3*2.^(2*t+1)*25.^(t)*101.^(-t-1)*1-heaviside(-t))*z2(1,t);
results1 = zeros(1,N+1);
results2 = zeros(1,N+1);

for t = 1:(N+1)
    results1(1,t) = C1(t);
    results2(1,t) = C2(t);
end

figure(1)
plot(results1)
title('C1')
xlabel('time')
ylabel('magnitude')

figure(2)
plot(results2)
title('C2')
xlabel('time')
ylabel('magnitude')