% System Simulation Problem 15
% Written by Josh Humphrey
clear
T = 0.1;
a = 1;
b = 1;
x = 1:T:10;
y = ones(1,length(x)); 
y(1) = 1;
Deriv_1 = zeros(1,length(x));
Deriv_2 = zeros(1,length(x));
Deriv_1(1) = 0.1;
Deriv_2(1) = 0.1;
R = ones(1,length(x));
t = linspace(0,length(x)*T,length(x));

for k=1:(length(x)-1)
    k1_1 = Deriv_1(k);
    k1_2 = Deriv_2(k);
    k1_3 = a*Deriv_2(k)+b*(1-R(k))*Deriv_1(k) + R(k);
    
    Mid1 = R(k)+0.5*T*k1_1;
    Mid2 = Deriv_1(k)+0.5*T*k1_2;
    Mid3 = Deriv_2(k)+0.5*T*k1_3;
    
    k2_1 = Mid2;
    k2_2 = Mid3;
    k2_3 = a*Mid3+b*(1-Mid1)*Mid2 + Mid1;
    
    Mid1 = R(k)+0.5*T*k2_1;
    Mid2 = Deriv_1(k)+0.5*T*k2_2;
    Mid3 = Deriv_2(k)+0.5*T*k2_3;
        
    k3_1 = Mid2;
    k3_2 = Mid3;
    k3_3 = a*Mid3+b*(1-Mid1)*Mid2 + Mid1;
    
    Mid1 = R(k)+0.5*T*k3_1;
    Mid2 = Deriv_1(k)+T*k3_2;
    Mid3 = Deriv_2(k)+T*k3_3;
    
    k4_1 = Mid2;
    k4_2 = Mid3;
    k4_3 = a*Mid3+b*(1-Mid1)*Mid2 + Mid1;
    
    R(k+1) = R(k)+(T/6)*(k1_1+(2*k2_1)+(2*k3_1)+k4_1);
    Deriv_1(k+1) = R(k)+(T/6)*(k1_2+(2*k2_2)+(2*k3_2)+k4_2);
    Deriv_2(k+1) = R(k)+(T/6)*(k1_3+(2*k2_3)+(2*k3_3)+k4_3);

end

figure(1)
plot(t,R)
title('Sprott Dynamic Happiness System: R vs T')

figure(2)
plot(t,Deriv_1)
title('Sprott Dynamic Happiness System: H vs T')

figure(3)
plot(R,Deriv_1)
title('Sprott Dynamic Happiness System: H vs R')


