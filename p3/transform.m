syms z
k = linspace(0,100,1000);
F = (50*(z-1)*(z^2-3.67*z+1.34))/(z^3+0.413*z^2-1.57*z+0.853);
diffEQ = iztrans(F,z,k);
results = zeros(1,100);
differenceEquation = matlabFunction(diffEQ)

results(1,1) = differenceEquation()

plot(results);