% Midterm Exam: System Simulation
% Written by Josh Humphrey
% Problem 4

Nr=10;
Nt=21;
animate=0;
rvec=linspace(1,Nr,Nr)/Nr;

theta=linspace(-pi,pi,1001);
theta=theta(1:length(theta)-1);

b0 = (15/289);
b1 = (229/578);
b2 = (319/578);
xlow = -2;
xhigh = 7;
ylow = -6;
yhigh = 6;

for m=1:Nr
    z=rvec(Nr-m+1)*exp(1i*theta);
    if (rvec(m) == 1)
        radius1 = z;
    end
    w = (z.^2-z)./(b2*z.^2+b1*z+b0);
    hold on
    plot(real(w),imag(w))
    hold off
    title(['Corrector Stability Region; r=',num2str(rvec(m))])
    xlabel('Re\{{\lambda}T \}')
    ylabel('Im\{{\lambda}T \}')
    axis([xlow xhigh ylow yhigh])
    axis square
    grid on
    pause(0.1)
end

tvec=linspace(0,Nt-1,Nt)*(2*pi)/Nt;
rho=linspace(0,1,101);
z=1*exp(1i*theta);
w = (z.^2-z)./(b2*z.^2+b1*z+b0);
hold on
    plot(real(w),imag(w))
hold off

axis([xlow xhigh ylow yhigh])
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