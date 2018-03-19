% System Simulation Problem 9
% Written by Josh Humphrey

%% Part B %%
clear
N = 10000;
Omega=linspace(0,2*pi,N+1);      %Set up vector of Omega
s=exp(1i*Omega);                  %Define z on unit circle
T=0.001;
H=(0.0850)./(s.^4+0.4174*s.^3+1.0871*s.^2+0.2805*s+0.1512);
       
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
    w=2*z.*(z-1)./(3*z-1);
    if(r>0.57)
        rhoccw(m)=100;
        subplot(121)
        title('AB-2 Stability Region')
        hold on
        plot(real(w),imag(w))
        hold off
        axis([-1.5 0.5 -1 1])
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
    w1=2*z1.*(z1-1)./(3*z1-1);
    w2=2*z2.*(z2-1)./(3*z2-1);
    
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
plot(-0.14759,-0.38759, 'x')
plot(-0.14759,0.38759, 'x')
plot(-0.0611034,-0.935565, 'x')
plot(-0.0611034,0.935565, 'x')
hold off



%% Part F %%
N=10000;
num = [0.0850];
den = [1 0.4174 1.0871 0.2805 0.1512];
[A,B,C,D] = tf2ss(num,den);

T_completely_stable = 0.01;
T_relatively_stable = 0.5;
T_relatively_unstable = 0.7;
T_completely_unstalbe = 1.0;

u = ones(1,N);
fx = zeros(1,N);
x = zeros(1,N);
y = zeros(1,N);
A = -0.4174;
B = -1.0871;
C = -0.2805;
D = -0.1512;
for k = 1:N-2
    fx(k) = A.*x(k) + B.*u(k);
    
    x(k+2) = x(k+1) + (T_relatively_stable/2)*(3*fx(k+1)-fx(k));
    y(k) = C.*x(k)+D.*u(k);
end

figure(4)
subplot(121)
plot(x,y)
title('Relatively Stable T')

u = ones(1,N);
fx = zeros(1,N);
x = zeros(1,N);
y = zeros(1,N);

for k = 1:N-2
    fx(k) = A.*x(k) + B.*u(k);
    
    x(k+2) = x(k+1) + (T_relatively_unstable/2)*(3*fx(k+1)-fx(k));
    y(k) = C.*x(k)+D.*u(k);
end

subplot(122)
plot(x,y)
title('Relatively Unstable T')

