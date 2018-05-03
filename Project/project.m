% System Simulation: Project
% Written by Josh Humphrey, 2018
% The SIR Model for Spread of Disease
% https://www.maa.org/press/periodicals/loci/joma/the-sir-model-for-spread-of-disease-the-differential-equation-model
clear
T = 1.0;
days = 150;
t = linspace(0,days,days);
S = zeros(1,days);  % Susceptible Individuals
I = zeros(1,days);  % Infected Individuals
R = zeros(1,days);  % Recovered Individuals
S(1) = 0.5;
I(1) = 0.5;
R(1) = 0;
k = (1/3);
b = (1/2);

for i = 1:days-1
   KS1 = -b*S(i)*I(i);
   KI1 = b*S(i)*I(i)-k*I(i);
   KR1 = k*I(i);
   
   MidS = S(i)+(T)*KS1;
   MidI = I(i)+(T)*KI1;
   MidR = R(i)+(T)*KR1;
   
   KS2 = -b*MidS*MidI;
   KI2 = b*MidS*MidI-k*MidI;
   KR2 = k*MidI;
   
   S(i+1) = S(i)+(T/2)*(KS1 + KS2);
   I(i+1) = I(i)+(T/2)*(KI1 + KI2);
   R(i+1) = R(i)+(T/2)*(KR1 + KR2);
end

figure(1)
hold on
grid on
plot(t,S)
plot(t,I)
plot(t,R)
title('Spread of Infectious Disease: I(1)=0.25')
legend('Susceptible','Infected','Recovered')
xlabel('Days')
ylabel('Population Percentage')


