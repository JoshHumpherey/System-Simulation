% Midterm Exam: System Simulation
% Written by Josh Humphrey
% Problem 2

Nr=10;
Nt=21;
animate=0;
rvec=linspace(1,Nr,Nr)/Nr;

theta=linspace(-pi,pi,1001);
theta=theta(1:length(theta)-1);
z=1*exp(1i*theta);

b0 = (6/17);
b1 = (11/17);
b2 = (0);
w = (z.^2-z)./(b2*z.^2+b1*z+b0);
xlow = -10;
xhigh = 10;
ylow = -10;
yhigh = 10;

for m=1:Nr
    z=rvec(Nr-m+1)*exp(1i*theta);
    w = (z.^2-z)./(b1*z+b0);
    hold on
    plot(real(w),imag(w))
    hold off
    title(['Corrector Stability Region; r=',num2str(rvec(m))])
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
w = (z.^2-z)./(b2*z.^2+b1*z+b0);
hold on
    plot(real(w),imag(w))
hold off

axis([-10 10 -10 10])
axis square
grid on


for m=1:Nt
    z=rho*exp(1i*tvec(m));
    w = (z.^2-z)./(b2*z.^2+b1*z+b0);

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
    title('Corrector Stability Region')
    xlabel('Re\{{\lambda}T \}')
    ylabel('Im\{{\lambda}T \}')
    axis([xlow xhigh ylow yhigh])
    axis square
    grid on
end