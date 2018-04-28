% System Simuation Final: Problem 3
% Written by Josh Humphrey

% Model Parameters
days = 400;
T = 0.5;
t = linspace(1,days,days);
alpha = 0.005;
beta = 0.0055;
zeta = 0.5;
delta = 0.001;
rho = 0.5;
c = 0.002;
p = 0.001;

% Populations
Middletown = 97.5;
Akron = 197.859;
Canal_Fulton = 5.479;
Cleveland = 389.521;
Columbus = 835.957;

% Initialization of Vectors
S = zeros(1,days); % Suceptable Humans
I = zeros(1,days); % Infected Group
Z = zeros(1,days); % Zombies
R = zeros(1,days); % Raise-able
K = zeros(1,days); % Unable to be re-animated
S(1)= Cleveland;
I(1)= 0;
Z(1)= 0;
R(1)= 0;
K(1)= 0;



for k = 1:days-1
    SK1 = p*S(k)-beta*Z(k)*S(k)-delta*S(k)+c*Z(k);
    IK1 = beta*Z(k)*S(k)-rho*I(k)-delta*I(k);
    ZK1= rho*I(k)+zeta*R(k)-alpha*S(k)*Z(k)-c*Z(k);
    RK1 = delta*S(k)-zeta*R(k);
    KK1 = delta*I(k)+alpha*S(k)*Z(k);

    MidS1 = S(k)+(T/2)*SK1;
    MidI1 = I(k)+(T/2)*IK1;
    MidZ1 = Z(k)+(T/2)*ZK1;
    MidR1 = R(k)+(T/2)*RK1;    
    MidK1 = K(k)+(T/2)*KK1;
    
    SK2 = p*MidS1-beta*MidZ1*MidS1-delta*MidS1+c*MidZ1;
    IK2 = beta*MidZ1*MidS1-rho*MidI1-delta*MidI1;
    ZK2 = rho*MidI1+zeta*MidR1-alpha*MidS1*MidZ1-c*MidZ1;
    RK2 = delta*MidS1-zeta*MidR1;
    KK2 = delta*MidI1+alpha*MidS1*MidZ1;

    MidS2 = S(k)+(T/2)*SK2;
    MidI2 = I(k)+(T/2)*IK2;
    MidZ2 = Z(k)+(T/2)*ZK2;
    MidR2 = R(k)+(T/2)*RK2;    
    MidK2 = K(k)+(T/2)*KK2;
    
    SK3 = p*MidS2-beta*MidZ2*MidS2-delta*MidS2+c*MidZ2;
    IK3 = beta*MidZ2*MidS2-rho*MidI2-delta*MidI2;
    ZK3 = rho*MidI2+zeta*MidR2-alpha*MidS2*MidZ2-c*MidZ2;
    RK3 = delta*MidS2-zeta*MidR2;
    KK3 = delta*MidI2+alpha*MidS2*MidZ2;
    
    MidS3 = S(k)+(T)*SK3;
    MidI3 = I(k)+(T)*IK3;
    MidZ3 = Z(k)+(T)*ZK3;
    MidR3 = R(k)+(T)*RK3;    
    MidK3 = K(k)+(T)*KK3;
    
    SK4 = p*MidS3-beta*MidZ3*MidS3-delta*MidS3+c*MidZ3;
    IK4 = beta*MidZ3*MidS3-rho*MidI3-delta*MidI3;
    ZK4 = rho*MidI3+zeta*MidR3-alpha*MidS3*MidZ3-c*MidZ3;
    RK4 = delta*MidS3-zeta*MidR3;
    KK4 = delta*MidI3+alpha*MidS3*MidZ3;
    
    S(k+1) = S(k)+(T/6)*(SK1 + 2*SK2 + 2*SK3 + SK4);
    I(k+1) = I(k)+(T/6)*(IK1 + 2*IK2 + 2*IK3 + IK4);
    Z(k+1) = Z(k)+(T/6)*(ZK1 + 2*ZK2 + 2*ZK3 + ZK4);
    R(k+1) = R(k)+(T/6)*(RK1 + 2*RK2 + 2*RK3 + RK4);
    K(k+1) = K(k)+(T/6)*(KK1 + 2*KK2 + 2*KK3 + KK4);
end

Cle_Z = Z;
Cle_H = S;

figure(1)
hold on
plot(t,S)
plot(t,I)
plot(t,R)
plot(t,Z)
legend('Humans','Infected','Raise-able','Zombies')
xlim([1,days])
grid on
xlabel('# of Days')
ylabel('Population (Thousands)')
title('Zombie Outbreak: Cleveland')

figure(2)
hold on
grid on
plot(t,Mid_H)
plot(t,Akr_H)
plot(t,CF_H)
plot(t,Cle_H)
plot(t,Col_H)
title('Human Populations')
legend('Middletown','Akron','Canal Fulton','Cleveland','Columbus')
xlabel('# of Days')
ylabel('Population (Thousands)')
xlim([1,days])
hold off

figure(3)
hold on
grid on
plot(t,Mid_Z)
plot(t,Akr_Z)
plot(t,CF_Z)
plot(t,Cle_Z)
plot(t,Col_Z)
title('Zombie Populations')
legend('Middletown','Akron','Canal Fulton','Cleveland','Columbus')
xlabel('# of Days')
ylabel('Population (Thousands)')
xlim([1,days])
hold off
