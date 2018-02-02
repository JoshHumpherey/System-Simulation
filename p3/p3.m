unitStep = ones(1,100);
results = zeros(1,100);

xkm3 = 0;
xkm2 = 0;
xkm1 = 0;
xk = unitStep;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;

for k = 1:100
    yk = -0.413*ykm1+1.57*ykm2-0.853*ykm3+50*xk(k)-233.5*xkm1+250.5*xkm2-67*xkm3;
    results(1,k) = yk;
    xkm3 = xkm2;
    xkm2 = xkm1;
    xkm1 = xk(k);
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
end

figure(1)
plot(results)
title('Unit Step Response')
xlabel('k')
ylabel('Response Magnitude')
    
unitImpulse = zeros(1,100);
unitImpulse(1,1) = 1;
results = zeros(1,100);

xkm3 = 0;
xkm2 = 0;
xkm1 = 0;
xk = unitImpulse;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;

for k = 1:100
    yk = -0.413*ykm1+1.57*ykm2-0.853*ykm3+50*xk(k)-233.5*xkm1+250.5*xkm2-67*xkm3;
    results(1,k) = yk;
    xkm3 = xkm2;
    xkm2 = xkm1;
    xkm1 = xk(k);
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
end

figure(2)
plot(results)
title('Unit Impulse Response')
xlabel('k')
ylabel('Response Magnitude')