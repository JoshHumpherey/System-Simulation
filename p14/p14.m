%Problem 14
%System Simulation

N = 10000;
t = linspace(0,10,N);
T_unstable = 2;
a = 0.3;
b = 0.2;
c = 0.5;
d = 0.03302;
E = 0.01;
V = 0;
I = zeros(1,N);
Y = zeros(1,N);
H = 100;

for k = 1:N-3
num = a*c*(V(k)-I(k))*(Y(k)/H)-d*I(k) == diff(I,k);
den = a*b*I(k)*((H-Y(k))/H)-E*Y(k) == diff(Y,k);
Solution = solve(den,Y);
end

figure(1)
plot(t,ySol);
title('Mosquito-Borne Disease')

