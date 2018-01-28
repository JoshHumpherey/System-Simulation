% System Simulation Problem 3
% Written by Josh Humphrey

unitStep = ones(1,100);
impulse = zeros(1,100);
impulse(1,1) = 1;
stepResults = zeros(1,100);
impulseResults = zeros(1,100);
wk = unitStep;
xkm3 = 0;
xkm2 = 0;
xkm1 = 0;
wkm2 = 0;
wkm1 = 0;
for k = 1:100
    stepResults(1,k) = (1/693333)*(-xkm3-185.333*xkm2-12133.3*xkm1+50*(-wkm2+33.3333*wkm1+133333*wk(k)));
    xkm3 = xkm2;
    xkm2 = xkm1;
    xkm1 = stepResults(1,k);
    wkm2 = wkm1;
    wkm1 = wk(k);
end

wk = impulse;
xkm3 = 0;
xkm2 = 0;
xkm1 = 0;
wkm2 = 0;
wkm1 = 0;
for k = 1:100
    impulseResults(1,k) = (1/693333)*(-xkm3-185.333*xkm2-12133.3*xkm1+50*(-wkm2+33.3333*wkm1+133333*wk(k)));
    xkm3 = xkm2;
    xkm2 = xkm1;
    xkm1 = impulseResults(1,k);
    wkm2 = wkm1;
    wkm1 = wk(k);
end
hold on
plot(impulseResults)
plot(stepResults)
title('Responses from Unit Step and Impulse')
legend('Impulse Response','Step Response')
xlabel('k')
ylabel('Response Magnitude')
