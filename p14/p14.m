% System Simulation Problem 14
% Written by Josh Humphrey
Ro = 1;
a = [0.3,0.1,0.5];
b = [0.2,0.03,0.4];
c = [0.5,0.275,0.4];
d = [0.03302,0.03304,0.1];
e = [0.01,0.0035,0.05];
m = [0,0,0];
for k = 1:3
    m(k) = Ro/((a(k))^2*b(k)*c(k)*(1/d(k))*(1/e(k)))
end





%%
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
plot(t,Solution);
title('Mosquito-Borne Disease')

