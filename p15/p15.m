% System Simulation Problem 15
% Written by Josh Humphrey
clear
N = 10000;
T = 0.01;
t = linspace(0,T*N,N);
Deriv_1 = zeros(1,N);
Deriv_2 = zeros(1,N);
R = zeros(1,N);
a = 0.5;
b = -5.6;
Deriv_1(1) = 0.01;
Deriv_2(1) = 0.01;

for k=1:(N-1)
    k1_1 = Deriv_1(k);
    k1_2 = Deriv_2(k);
    k1_3 = -a.*Deriv_2(k)-b.*(1-R(k)^2).*Deriv_1(k)-R(k);
    
    Mid1_1=R(k)+.5.*T.*k1_1;
    Mid1_2=Deriv_1(k)+.5.*T.*k1_2;
    Mid1_3=Deriv_2(k)+.5*T.*k1_3;
    
    k2_1 = Mid1_2;
    k2_2 = Mid1_3;
    k2_3 = -a*Mid1_3-b.*(1-Mid1_1.^2) .* Mid1_2 - Mid1_1;
    
    Mid2_1=R(k)+.5*T*k2_1;
    Mid2_2=Deriv_1(k)+.5*T.*k2_2;
    Mid2_3=Deriv_2(k)+.5*T.*k2_3;
    
    k3_1 = Mid2_2;
    k3_2 = Mid2_3;
    k3_3 = -a.*Mid2_3-b.*(1-Mid2_1^2).*Mid2_2 - Mid2_1;

    Mid3_1=R(k)+T.*k3_1;
    Mid3_2=Deriv_1(k)+T.*k3_2;
    Mid3_3=Deriv_2(k)+T.*k3_3;
    
    k4_1 = Mid3_2;
    k4_2 = Mid3_3;
    k4_3 = -a.*Mid3_3-b.*(1-Mid3_1^2).*Mid3_2-Mid3_1;
        
    R(k+1) = R(k) + (T/6).*(k1_1+2.*k2_1+2.*k3_1+k4_1);
    Deriv_1(k+1) = Deriv_1(k) + (T/6).*(k1_2+2.*k2_2+2.*k3_2+k4_2);
    Deriv_2(k+1) = Deriv_2(k) + (T/6).*(k1_3+2.*k2_3+2.*k3_3+k4_3);
end

figure(1)
plot(t,R)
title('R vs T')

figure(2)
plot(t,Deriv_1)
title('H vs T')

figure(3)
plot(R,Deriv_1)
title('H vs R')


