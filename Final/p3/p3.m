% System Simuation Final: Problem 3
% Written by Josh Humphrey

% Model Parameters
days = 1200;
T = 0.1;
t = linspace(1,days,days);
alpha = 0.005;
beta = 0.0055;
zeta = 0.5;
delta = 0.001;
rho = 0.5;
c = 0.002;
pii = 0.001;

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
S(1)= Middletown;
I(1)= 0;
Z(1)= 0;
R(1)= 0;
K(1)= 0;



for k = 1:days-1
    SK1 = pii*S(k)-beta*Z(k)*S(k)-delta*S(k)+c*Z(k);
    IK1 = beta*Z(k)*S(k)-rho*I(k)-delta*I(k);
    ZK1= rho*I(k)+zeta*R(k)-alpha*S(k)*Z(k)-c*Z(k);
    RK1 = delta*S(k)-zeta*R(k);
    KK1 = delta*I(k)+alpha*S(k)*Z(k);

    MidS = S(k)+(T)*SK1;
    MidI = I(k)+(T)*IK1;
    MidZ = Z(k)+(T)*ZK1;
    MidR = R(k)+(T)*RK1;    
    MidK = K(k)+(T)*KK1;
    
    SK2 = pii*SK1-beta*ZK1*SK1-delta*SK1+c*ZK1;
    IK2 = beta*ZK1*SK1-rho*IK1-delta*IK1;
    ZK2 = rho*IK1+zeta*RK1-alpha*SK1*ZK1-c*ZK1;
    RK2 = delta*SK1-zeta*RK1;
    KK2 = delta*IK1+alpha*SK1*ZK1;

    S(k+1) = S(k)+(T/2)*(SK1 + SK2);
    I(k+1) = I(k)+(T/2)*(IK1 + IK2);
    Z(k+1) = Z(k)+(T/2)*(ZK1 + ZK2);
    R(k+1) = R(k)+(T/2)*(RK1 + RK2);
    K(k+1) = K(k)+(T/2)*(KK1 + KK2);
end

Mid_Z = Z;
Mid_H = S;

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
title('Zombie Outbreak: Columbus')

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
