% System Simuation Final: Problem 5
% Written by Josh Humphrey
N = 60;
T = 1;
t = linspace(0,N,N);
alpha_1 = 0.1;
alpha_2 = 0.3;
fx1 = zeros(1,N);
fx2 = zeros(1,N);
x1 = zeros(1,N); % Feelings Belle has for the Beast
x2 = zeros(1,N); % Feelings the Beast has for Belle

% Simulate using AB-2 (No Method was Specified In the Problem)
for k = 2:N-1
   fx1(k) = -alpha_1*x1(k)+R1(x2(k))+A2(k);
   fx2(k) = -alpha_2*x2(k)+R2(x1(k))+A1(k);

   x1(k+1) = x1(k) + (3*T)./(2)*fx1(k)-(T/2)*fx1(k-1);
   x2(k+1) = x2(k) + (3*T)./(2)*fx2(k)-(T/2)*fx2(k-1);
end

figure(1)
hold on
grid on
plot(t,x1)
plot(t,x2)
title('Part A')
xlabel('Time')
ylabel('Strength of Feelings')
legend('Belles Feelings','Beast Feelings')
