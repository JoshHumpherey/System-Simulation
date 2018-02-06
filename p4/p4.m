% System Simulation Problem 4
% Written by Josh Humphrey

N = 1000
z = linspace(0,100,N);
T = 0.01;
z1 = ones(1,N+1);
z2 = ones(1,N+1);
s = ((z-1)/(T*z));
C1 = @(z) (-2/(1+s))*z1(1,z)+(3/(1+s))*z2(1,z);
C2 = @(z) (4/(1+s))*z1(1,z)+((2+8*s)/(4/(s+1)))*z2(1,z);
results1 = zeros(1,N+1);
results2 = zeros(1,N+1);

for z = 1:(N+1)
    results1(1,z) = C1(z);
    results2(1,z) = C2(z);
end

figure(1)
plot(results1,'o')
plot(results2,'o')