% System Simulation Problem 10
% Written by Josh Humphrey

%% Part B %%
clear
N = 10000;
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
s=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H = (0.6042*s.^4+4.1572*s.^2+6.1591)./(s.^5+3.4630*s.^4+7.1704*s.^3+10.2787*s.^2+8.6926*s+6.159);
       
figure (1)
subplot(2,1,1)
plot(Omega,abs(H));
title('Frequency Response (Magnitude)')
        
subplot(2,1,2)
plot(Omega,angle(H));
title('Frequency Response (Angle)')

%% Part C %%
figure(2)
run=2;
Nr=10;
Ntheta=80;

rho=linspace(1,Nr,Nr)/Nr;
theta=linspace(0,(Ntheta-1)/Ntheta,Ntheta)*2*pi;
    
rhocw=rho;
rhoccw=rho;

p=linspace(0,2*pi,1001);
for m=1:Nr
    r=rho(Nr-m+1);
    z=r*exp(i*p);
    w=(12*(z.^2).*(z-1)./(23*(z.^2)-16*z+5));
    if(r>0.57)
        rhoccw(m)=100;
        subplot(121)
        title('AB-3 Stability Region')
        hold on
        plot(real(w),imag(w))
        hold off
        axis([-1 1 -1.5 1.5])
    else
        rhocw(m)=0;
        subplot(122)
         title('r=1')
        hold on
        plot(real(w),imag(w))
        hold off
        axis([-1 1 -1 1])
    end    
    
end
if(run==3)
    pause
end


r1=linspace(min(rhoccw),1,1001);
r2=linspace(0,max(rhocw),1001);

for m=1:length(theta)
    z1=r1*exp(i*theta(m));
    z2=r2*exp(i*theta(m));
    w1=(12*(z1.^2).*(z1-1)./(23*(z1.^2)-16*z1+5));
    w2=(12*(z2.^2).*(z2-1)./(23*(z2.^2)-16*z2+5));
    
    subplot(121)
    hold on
        plot(real(w1),imag(w1))
    hold off
    subplot(122)
    hold on
        plot(real(w2),imag(w2))
    hold off
    
end

% Add in part D poles
subplot(121)
hold on
plot(-1.75552,0, 'x')
plot(-0.71469,-1.26945, 'x')
plot(-0.71469,1.26945, 'x')
plot(-0.139044,-1.278189, 'x')
plot(-0.139044,1.278189, 'x')
hold off

%% Part F %%
clear
N=10000;
t = linspace(0,10,N);
num = [0.6042 0 4.1572 0 6.1591];
den = [1 3.4630 7.1704 10.2787 8.6926 6.159];
[A,B,C,D] = tf2ss(num,den);

T_completely_stable = 0.01;
T_relatively_stable = 0.3;
T_relatively_unstable = 0.5;
T_completely_unstalbe = 1.0;

u = ones(1,N);
fx1 = zeros(1,N);
fx2 = zeros(1,N);
fx3 = zeros(1,N);
fx4 = zeros(1,N);
fx5 = zeros(1,N);
x1 = zeros(1,N);
x2 = zeros(1,N);
x3 = zeros(1,N);
x4 = zeros(1,N);
x5 = zeros(1,N);
y = zeros(1,N);

for k = 1:N-2
    fx1(k) = -3.463*x1(k)-7.1704*x2(k)-10.2787*x3(k)-8.6926*x4(k)-6.159*x5(k) + u(k);
    fx2(k) = x1(k);
    fx3(k) = x2(k);
    fx4(k) = x3(k);
    fx5(k) = x4(k);
    
    x1(k+3) = x1(k+2)+(T_relatively_stable)*((23/12)*fx1(k+2)-(4/3)*fx1(k+1)+(5/12)*fx1(k));
    x2(k+3) = x2(k+2)+(T_relatively_stable)*((23/12)*fx2(k+2)-(4/3)*fx2(k+1)+(5/12)*fx2(k));
    x3(k+3) = x3(k+2)+(T_relatively_stable)*((23/12)*fx3(k+2)-(4/3)*fx3(k+1)+(5/12)*fx3(k));
    x4(k+3) = x4(k+2)+(T_relatively_stable)*((23/12)*fx4(k+2)-(4/3)*fx4(k+1)+(5/12)*fx4(k));
    x5(k+3) = x5(k+2)+(T_relatively_stable)*((23/12)*fx5(k+2)-(4/3)*fx5(k+1)+(5/12)*fx5(k));
    y(k) = 0.6042*x1(k) + 4.1572*x3(k)+6.1591*x5(k);
end

figure(4)
subplot(121)
plot(y,t)
xlim([0,10])
title('Relatively Stable T')

u = ones(1,N);
fx1 = zeros(1,N);
fx2 = zeros(1,N);
fx3 = zeros(1,N);
fx4 = zeros(1,N);
fx5 = zeros(1,N);
x1 = zeros(1,N);
x2 = zeros(1,N);
x3 = zeros(1,N);
x4 = zeros(1,N);
x5 = zeros(1,N);
y = zeros(1,N);

for k = 1:N-2
    fx1(k) = -3.463*x1(k)-7.1704*x2(k)-10.2787*x3(k)-8.6926*x4(k)-6.159*x5(k) + u(k);
    fx2(k) = x1(k);
    fx3(k) = x2(k);
    fx4(k) = x3(k);
    fx5(k) = x4(k);
    
    x1(k+3) = x1(k+2)+(T_relatively_stable)*((23/12)*fx1(k+2)-(4/3)*fx1(k+1)+(5/12)*fx1(k));
    x2(k+3) = x2(k+2)+(T_relatively_stable)*((23/12)*fx2(k+2)-(4/3)*fx2(k+1)+(5/12)*fx2(k));
    x3(k+3) = x3(k+2)+(T_relatively_stable)*((23/12)*fx3(k+2)-(4/3)*fx3(k+1)+(5/12)*fx3(k));
    x4(k+3) = x4(k+2)+(T_relatively_stable)*((23/12)*fx4(k+2)-(4/3)*fx4(k+1)+(5/12)*fx4(k));
    x5(k+3) = x5(k+2)+(T_relatively_stable)*((23/12)*fx5(k+2)-(4/3)*fx5(k+1)+(5/12)*fx5(k));
    y(k) = 0.6042*x1(k) + 4.1572*x3(k)+6.1591*x5(k);
end

subplot(122)
plot(y,t)
xlim([0,10])
title('Relatively Unstable T')