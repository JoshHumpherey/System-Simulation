% System Simulation Problem 9
% Written by Josh Humphrey

N = 10000
period = 10;
z = linspace(0,period,N);
f = @(z) 17/(200*((561*z)/2000 + (10871*(z - 1/z)^2)/10000 + (2087*(z - 1/z)^3)/5000 + (z - 1/z)^4 - 561/(2000*z) + 189/1250))
results = linspace(0,period,N);
% Plot Frequency Response of Fz
for z = 1:N
    results(z) = f(z);
end

plot(results)
xlim([0,10])
title('Frequency Response of F')


