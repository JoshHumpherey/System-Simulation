% Midterm Exam: System Simulation
% Written by Josh Humphrey

%% Problem 2

% Plot the Stability Region:
figure(2)
run=2;
Nr=10;
Ntheta=80;

rho=linspace(1,Nr,Nr)/Nr;
theta=linspace(0,(Ntheta-1)/Ntheta,Ntheta)*2*pi;
    
rhocw=rho;
rhoccw=rho;

B0 = 11/17;
B1 = 121/102;

p=linspace(0,2*pi,1001);
for m=1:Nr
    r=rho(Nr-m+1);
    z=r*exp(i*p);
    w=(B1.*z+B0)./(z.^2+z);
    if(r>0.57)
        rhoccw(m)=100;
        title('Predictor Stability Region')
        hold on
        plot(real(w),imag(w))
        hold off
        axis([-5 5 -5 5])
    end    
    
end
if(run==3)
    pause
end


r1=linspace(min(rhoccw),1,1001);

for m=1:length(theta)
    z1=r1*exp(i*theta(m));
    w1=(B1.*z+B0)./(z.^2+z);
    hold on
        plot(real(w1),imag(w1))
    hold off
end

