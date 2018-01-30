% System Simulation Problem 3
% Written by Josh Humphrey

z = linspace(1,100);
T = 0.01
unitStep = ones(1,100);
unitImpulse = zeros(1,100);
for i = 1:5
    unitImpulse(1,i) = 1;
end
unitStepResults = zeros(1,100);
unitImpulseResults = zeros(1,100);

Gdiscrete = @(z)(50*(-1+33.3333.*(T./(z-1))+13333.33.*(((T.^2)*(z))./((z-1).^2))))./(1+185.333.*(T./(z-1))+12133.3.*(((T.^2)*(z))./((z-1).^2))+693333.*(((T.^3)*(z^2+z))./(2*(z-1).^3)));

for z = 1:100
    unitStepResults(1,z) = Gdiscrete(z)*unitStep(1,z);
    unitImpulseResults(1,z) = Gdiscrete(z)*unitImpulse(1,z);
end

figure(1)
plot(unitStepResults)
title('Unit Step Response')
xlabel('Z')
ylabel('Response Magnitude')

figure(2)
plot(unitImpulseResults)
title('Unit Impulse Response')
xlabel('Z')
ylabel('Response Magnitude')