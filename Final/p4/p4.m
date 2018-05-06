% System Simuation Final: Problem 4
% Written by Josh Humphrey
%% Part E:
clear
Nr=10;
Nt=21;
animate=0;
rvec=linspace(1,Nr,Nr)/Nr;

theta=linspace(-pi,pi,1001);
theta=theta(1:length(theta)-1);
z=1*exp(1i*theta);

b0 = (6/17);
b1 = (11/17);
b2 = (1);
b3 = (1);
xlow = -10;
xhigh = 0;
ylow = -6;
yhigh = 6;
figure(1)
for m=1:Nr
    z=rvec(Nr-m+1)*exp(1i*theta);
    w = (z.^2-z)./(b3*z.^3+b2*z.^2+b1*z+b0);
    hold on
    plot(real(w),imag(w))
    hold off
    title(['Part E: Stability Region; r=',num2str(rvec(m))])
    xlabel('Re\{{\lambda}T \}')
    ylabel('Im\{{\lambda}T \}')
    axis([xlow xhigh ylow yhigh])
    axis square
    grid on
    pause(0.5)
end

tvec=linspace(0,Nt-1,Nt)*(2*pi)/Nt;
rho=linspace(0,1,101);
z=1*exp(1i*theta);
    w = (z.^2-z)./(b3*z.^3+b2*z.^2+b1*z+b0);
hold on
    plot(real(w),imag(w))
hold off

axis([xlow xhigh ylow yhigh])
axis square
grid on


for m=1:Nt
    z=rho*exp(1i*tvec(m));
    w = (z.^2-z)./(b3*z.^3+b2*z.^2+b1*z+b0);

    if(animate==1)
        for n=1:length(rho)
            hold on
                plot(real(w(n)),imag(w(n)))
            hold off
            pause(0.01)
        end
    end

    hold on
        plot(real(w),imag(w))
    hold off
    title('Part E: Stability Region')
    xlabel('Re\{{\lambda}T \}')
    ylabel('Im\{{\lambda}T \}')
    axis([xlow xhigh ylow yhigh])
    axis square
    grid on
end



%% Part F:
N = 10000;
T = 0.01;
t = linspace(0,1000,N);
x1 = zeros(1,N);
x2 = zeros(1,N);
x3 = zeros(1,N);
f1 = zeros(1,N);
f2 = zeros(1,N);
f3 = zeros(1,N);
x1(1) = 1;
x2(1) = 1*10^10;
x3(1) = 1*10^-10;

for k = 1:(N-1)
    f1(k) = -0.04*x1(k)+(10^4)*x2(k)*x3(k);
    x1(k+1) = x1(k)+T*f1(k);
    
    f2(k) = 0.04*x1(k)-(10^4)*x2(k)*x3(k)-(3*10^7)*(x2(k))^2;
    x2(k+1) = x2(k)+T*f2(k);
    
    f3(k) = (3*10^7)*(x2(k))^2;
    x3(k+1) = x3(k)+T*f3(k);
end

figure(2)
grid on
hold on
semilogx(t,x1)
semilogx(t,x2)
semilogx(t,x3)
title('Problem 4')
legend('x1','x2','x3')