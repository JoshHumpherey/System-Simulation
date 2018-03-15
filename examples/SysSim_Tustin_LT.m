Nr=10;
Nt=21;
animate=0;


rvec=linspace(1,Nr,Nr)/Nr;

clf
theta=linspace(-pi,pi,1001);
theta=theta(1:length(theta)-1);




figure(1)
clf

for m=1:Nr
z=rvec(Nr-m+1)*exp(j*theta);

w=2*(z-1)./(z+1);
hold on
plot(real(w),imag(w))
hold off
title(['Tustin Stability Region; r=',num2str(rvec(m))])
xlabel('Re\{{\lambda}T \}')
ylabel('Im\{{\lambda}T \}')
axis([-5 5 -5 5])
axis square
grid on
pause(0.1)
end


tvec=linspace(0,Nt-1,Nt)*(2*pi)/Nt;

rho=linspace(0,1,101);

%figure(2)
%clf

z=1*exp(j*theta);

w=2*(z-1)./(z+1);
hold on
    plot(real(w),imag(w))
hold off

axis([-5 5 -5 5])
axis square
grid on


for m=1:Nt
z=rho*exp(j*tvec(m));

w=2*(z-1)./(z+1);
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
title('Tustin Stability Region')
xlabel('Re\{{\lambda}T \}')
ylabel('Im\{{\lambda}T \}')
axis([-5 5 -5 5])
axis square
grid on
end
