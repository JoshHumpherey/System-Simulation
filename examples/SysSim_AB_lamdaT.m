run=2;
Nr=10;
Ntheta=80;

rho=linspace(1,Nr,Nr)/Nr;
theta=linspace(0,(Ntheta-1)/Ntheta,Ntheta)*2*pi;



t=linspace(0,2*pi,501);

figure(3)
clf
figure(2)
clf
figure(1)
clf
for m=1:Nr
    r=rho(Nr-m+1);
    z=r*exp(i*t);
    w=2*z.*(z-1)./(3*z-1);
    hold on
    plot(real(w),imag(w))
    hold off
    axis([-1 1 -1 1])
end

if(run==1)
    pause
end
    
rhocw=rho;
rhoccw=rho;

figure(2)

p=linspace(0,2*pi,1001);
for m=1:Nr
    r=rho(Nr-m+1);
    z=r*exp(i*p);
    w=2*z.*(z-1)./(3*z-1);
    if(r>0.57)
        rhoccw(m)=100;
        subplot(121)
        hold on
        plot(real(w),imag(w))
        hold off
        axis([-1 1 -1 1])
    else
        rhocw(m)=0;
        subplot(122)
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



if(run==3)
    pause
end



figure(3)
for m=1:Nr
    r=rho(Nr-m+1);
    z=r*exp(i*t);
    w=2*z.*(z-1)./(3*z-1);
    if(r>0.57)
        ist='b';
    else
        ist='r'
    end
    for k=1:length(w)
        hold on
            plot(real(w(k)),imag(w(k)),ist)
        hold off
        pause(0.01)
        axis([-1 1 -1 1])
        title(['r=',num2str(r)])
    end
end
    
