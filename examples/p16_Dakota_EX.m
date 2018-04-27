%% System Simulations Homework 16

% Author: Dakota Wood

% Date: 04/24/2018
% Alpha=2,15 Beta=1 a=0.07 b=0.1
% 
% Use 4th order Runge Kutta
%Simulate model 
%Use Small Initial Conditions
%Submit plots of error vs time, timestep vs time , state varibles vs time,
%x vs y
%% Initialization
clc
clear all
close all
Alpha1=2;
Alpha2=15;
Beta=1;
a=0.07;
b=0.1;
N=50000;
% Simulation
g=1;
f=g;
v=g;
X1=zeros(1,N);
T=X1;
Y1=X1;
Z1=X1;
EX1=X1;
EY1=X1;
EZ1=X1;
SX1=X1;
SX2=X1;
SX3=X1;
SX4=X1;
SY1=X1;
SY2=X1;
SY3=X1;
SY4=X1;
SZ1=X1;
SZ2=X1;
SZ3=X1;
SZ4=X1;
MX1=X1;
MX2=X1;
MX3=X1;
MY1=X1;
MY2=X1;
MY3=X1;
MZ1=X1;
MZ2=X1;
MZ3=X1;
ETOT=X1;
ETOT2=X1;
Emax1=5;
Emin1=0.1;
X1(1)=0.1;
Y1(1)=0.1;
Z1(1)=0.1;
T(1)=0.1;
XTX1=linspace(0,N*T(1),N);

 for k=1:N-1
SX1(k)=-Alpha1*(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)));
SY1(k)=-(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)))-Z1(k);
SZ1(k)=Beta*Y1(k);

MX1(k)=X1(k)+0.5*T(k)*SX1(k);
MY1(k)=Y1(k)+0.5*T(k)*SY1(k);
MZ1(k)=Z1(k)+0.5*T(k)*SZ1(k);

SX2(k)= -Alpha1*(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)));
SY2(k)=-(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)))-MZ1(k);
SZ2(k)=Beta*MY1(k);

MX2(k)=X1(k)+0.5*T(k)*SX2(k);
MY2(k)=Y1(k)+0.5*T(k)*SY2(k);
MZ2(k)=Z1(k)+0.5*T(k)*SZ2(k);

SX3(k)=  -Alpha1*(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)));
SY3(k)=-(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)))-MZ2(k);
SZ3(k)=Beta*MY2(k);

MX3(k)=X1(k)+T(k)*SX3(k);
MY3(k)=Y1(k)+T(k)*SY3(k);
MZ3(k)=Z1(k)+T(k)*SZ3(k);

SX4(k)=  -Alpha1*(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)));
SY4(k)=-(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)))-MZ3(k);
SZ4(k)=Beta*MY3(k);

X1(k+1)= X1(k)+(T(k)/6)*(SX1(k)+(2*SX2(k))+(2*SX3(k))+SX4(k));
Y1(k+1)= Y1(k)+(T(k)/6)*(SY1(k)+(2*SY2(k))+(2*SY3(k))+SY4(k));
Z1(k+1)= Z1(k)+(T(k)/6)*(SZ1(k)+(2*SZ2(k))+(2*SZ3(k))+SZ4(k));

EX1(k)=X1(k+1)-MX1(k)-MX2(k)-MX3(k);
EY1(k)=Y1(k+1)-MY1(k)-MY2(k)-MY3(k);
EZ1(k)=Z1(k+1)-MZ1(k)-MZ2(k)-MZ3(k);

ETOT(k)=abs(EX1(k))+abs(EY1(k))+abs(EZ1(k));

if (ETOT(k)>0.8*Emax1 && ETOT(k)<Emax1)
    T(k+1)=T(k);
end
if(ETOT(k)<=0.8*Emax1 && ETOT(k)>Emin1)
    T(k+1)=1.05*T(k);
end
if(ETOT(k)<=Emin1 && ETOT(k)< 0.8*Emax1)
         T(k+1)=1.25*T(k);
end 

if (ETOT(k)>Emax1)
g=1+g;    

T(k)=T(k)*0.5;
SX1(k)=-Alpha1*(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)));
SY1(k)=-(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)))-Z1(k);
SZ1(k)=Beta*Y1(k);

MX1(k)=X1(k)+0.5*T(k)*SX1(k);
MY1(k)=Y1(k)+0.5*T(k)*SY1(k);
MZ1(k)=Z1(k)+0.5*T(k)*SZ1(k);

SX2(k)= -Alpha1*(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)));
SY2(k)=-(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)))-MZ1(k);
SZ2(k)=Beta*MY1(k);

MX2(k)=X1(k)+0.5*T(k)*SX2(k);
MY2(k)=Y1(k)+0.5*T(k)*SY2(k);
MZ2(k)=Z1(k)+0.5*T(k)*SZ2(k);

SX3(k)=  -Alpha1*(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)));
SY3(k)=-(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)))-MZ2(k);
SZ3(k)=Beta*MY2(k);

MX3(k)=X1(k)+T(k)*SX3(k);
MY3(k)=Y1(k)+T(k)*SY3(k);
MZ3(k)=Z1(k)+T(k)*SZ3(k);

SX4(k)=  -Alpha1*(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)));
SY4(k)=-(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)))-MZ3(k);
SZ4(k)=Beta*MY3(k);

X1(k+1)= X1(k)+(T(k)/6)*(SX1(k)+(2*SX2(k))+(2*SX3(k))+SX4(k));
Y1(k+1)= Y1(k)+(T(k)/6)*(SY1(k)+(2*SY2(k))+(2*SY3(k))+SY4(k));
Z1(k+1)= Z1(k)+(T(k)/6)*(SZ1(k)+(2*SZ2(k))+(2*SZ3(k))+SZ4(k));

EX1(k)=X1(k+1)-MX1(k)-MX2(k)-MX3(k);
EY1(k)=Y1(k+1)-MY1(k)-MY2(k)-MY3(k);
EZ1(k)=Z1(k+1)-MZ1(k)-MZ2(k)-MZ3(k);

ETOT2(k)=abs(EX1(k))+abs(EY1(k))+abs(EZ1(k));

end

if T(k)==0
    T(k+1)=T(1);
else 
    T(k)=T(k);
end
end
figure(1)
plot(XTX1,abs(EX1))
hold on
plot(XTX1,X1)
hold off
title('Alpha=2 X1 vs EX1 over Time')
xlabel('Samples')
ylabel('X1 and EX1')
legend('Error of X','X') 

figure(2)
plot(XTX1,-EY1)
hold on
plot(XTX1,Y1)
hold off
title('Alpha=2 Y1 vs EY1 over Time')
xlabel('Samples')
ylabel('Y1 and EY1')
legend('Error of Y','Y') 

figure(3)
plot(XTX1,-EZ1)
hold on
plot(XTX1,Z1)
hold off
title('Alpha=2 Z1 vs Error over Time')
xlabel('Samples')
ylabel('Z1 & EZ1')
legend('Error of Z','Z') 
figure(4)
plot(XTX1,T)
title('Alpha=2 Sampling Time')
xlabel('Samples')
ylabel('Sampling Time')

figure(5)
plot(Y1(10000:49000),X1(10000:49000))
title('Alpha X Y Phase Plot')
xlabel('X1')
ylabel('Y1')

figure(6)
plot3(X1(10000:49000),Y1(10000:49000),Z1(10000:49000))
title('Alpha=2 3D Phase Plot of X Y Z')
xlabel('X1')
ylabel('Y1')
zlabel('Z1')
%% Alpha = 15
Alpha1=15;

Beta=1;
a=0.07;
b=0.1;
N=50000;
% Simulation
g=1;
f=g;
v=g;
X1=zeros(1,N);
T=X1;
Y1=X1;
Z1=X1;
EX1=X1;
EY1=X1;
EZ1=X1;
SX1=X1;
SX2=X1;
SX3=X1;
SX4=X1;
SY1=X1;
SY2=X1;
SY3=X1;
SY4=X1;
SZ1=X1;
SZ2=X1;
SZ3=X1;
SZ4=X1;
MX1=X1;
MX2=X1;
MX3=X1;
MY1=X1;
MY2=X1;
MY3=X1;
MZ1=X1;
MZ2=X1;
MZ3=X1;
ETOT=X1;
ETOT2=X1;
Emax1=5
Emin1=0.001;
% Tmin1=0.00001
X1(1)=0.01;
Y1(1)=0.01;
Z1(1)=0.01;
T(1)=0.1;
XTX1=linspace(0,N*T(1),N);
%Tmin=0.000001;

 for k=1:N-1
SX1(k)=-Alpha1*(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)));
SY1(k)=-(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)))-Z1(k);
SZ1(k)=Beta*Y1(k);

MX1(k)=X1(k)+0.5*T(k)*SX1(k);
MY1(k)=Y1(k)+0.5*T(k)*SY1(k);
MZ1(k)=Z1(k)+0.5*T(k)*SZ1(k);

SX2(k)= -Alpha1*(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)));
SY2(k)=-(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)))-MZ1(k);
SZ2(k)=Beta*MY1(k);

MX2(k)=X1(k)+0.5*T(k)*SX2(k);
MY2(k)=Y1(k)+0.5*T(k)*SY2(k);
MZ2(k)=Z1(k)+0.5*T(k)*SZ2(k);

SX3(k)=  -Alpha1*(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)));
SY3(k)=-(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)))-MZ2(k);
SZ3(k)=Beta*MY2(k);

MX3(k)=X1(k)+T(k)*SX3(k);
MY3(k)=Y1(k)+T(k)*SY3(k);
MZ3(k)=Z1(k)+T(k)*SZ3(k);

SX4(k)=  -Alpha1*(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)));
SY4(k)=-(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)))-MZ3(k);
SZ4(k)=Beta*MY3(k);

X1(k+1)= X1(k)+(T(k)/6)*(SX1(k)+(2*SX2(k))+(2*SX3(k))+SX4(k));
Y1(k+1)= Y1(k)+(T(k)/6)*(SY1(k)+(2*SY2(k))+(2*SY3(k))+SY4(k));
Z1(k+1)= Z1(k)+(T(k)/6)*(SZ1(k)+(2*SZ2(k))+(2*SZ3(k))+SZ4(k));

EX1(k)=X1(k+1)-MX1(k)-MX2(k)-MX3(k);
EY1(k)=Y1(k+1)-MY1(k)-MY2(k)-MY3(k);
EZ1(k)=Z1(k+1)-MZ1(k)-MZ2(k)-MZ3(k);

ETOT(k)=abs(EX1(k))+abs(EY1(k))+abs(EZ1(k));

if (ETOT(k)>0.8*Emax1 && ETOT(k)<Emax1)
    T(k+1)=T(k);
end
if(ETOT(k)<=0.8*Emax1)
    T(k+1)=1.05*T(k);
end
if(ETOT(k)<=Emin1 && ETOT(k)< 0.8*Emax1)
         T(k+1)=1.25*T(k);
end 

if (ETOT(k)>Emax1)
g=1+g;    

    T(k)=T(k)*0.5;
    SX1(k)=-Alpha1*(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)));
SY1(k)=-(-a*(Y1(k)-X1(k))+0.5*(b+a)*(abs(Y1(k)-X1(k)+1)-abs(Y1(k)-X1(k)-1)))-Z1(k);
SZ1(k)=Beta*Y1(k);

MX1(k)=X1(k)+0.5*T(k)*SX1(k);
MY1(k)=Y1(k)+0.5*T(k)*SY1(k);
MZ1(k)=Z1(k)+0.5*T(k)*SZ1(k);

SX2(k)= -Alpha1*(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)));
SY2(k)=-(-a*(MY1(k)-MX1(k))+0.5*(b+a)*(abs(MY1(k)-MX1(k)+1)-abs(MY1(k)-MX1(k)-1)))-MZ1(k);
SZ2(k)=Beta*MY1(k);

MX2(k)=X1(k)+0.5*T(k)*SX2(k);
MY2(k)=Y1(k)+0.5*T(k)*SY2(k);
MZ2(k)=Z1(k)+0.5*T(k)*SZ2(k);

SX3(k)=  -Alpha1*(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)));
SY3(k)=-(-a*(MY2(k)-MX2(k))+0.5*(b+a)*(abs(MY2(k)-MX2(k)+1)-abs(MY2(k)-MX2(k)-1)))-MZ2(k);
SZ3(k)=Beta*MY2(k);

MX3(k)=X1(k)+T(k)*SX3(k);
MY3(k)=Y1(k)+T(k)*SY3(k);
MZ3(k)=Z1(k)+T(k)*SZ3(k);

SX4(k)=  -Alpha1*(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)));
SY4(k)=-(-a*(MY3(k)-MX3(k))+0.5*(b+a)*(abs(MY3(k)-MX3(k)+1)-abs(MY3(k)-MX3(k)-1)))-MZ3(k);
SZ4(k)=Beta*MY3(k);

X1(k+1)= X1(k)+(T(k)/6)*(SX1(k)+(2*SX2(k))+(2*SX3(k))+SX4(k));
Y1(k+1)= Y1(k)+(T(k)/6)*(SY1(k)+(2*SY2(k))+(2*SY3(k))+SY4(k));
Z1(k+1)= Z1(k)+(T(k)/6)*(SZ1(k)+(2*SZ2(k))+(2*SZ3(k))+SZ4(k));

EX1(k)=X1(k+1)-MX1(k)-MX2(k)-MX3(k);
EY1(k)=Y1(k+1)-MY1(k)-MY2(k)-MY3(k);
EZ1(k)=Z1(k+1)-MZ1(k)-MZ2(k)-MZ3(k);

ETOT2(k)=abs(EX1(k))+abs(EY1(k))+abs(EZ1(k));

end

if T(k)==0
    T(k+1)=T(1);
else 
    T(k)=T(k);
end
end
figure(8)
plot(XTX1,abs(EX1))
hold on
plot(XTX1,X1)
hold off
title('Alpha=15 X1 vs EX1 over Time')
xlabel('Samples')
ylabel('X1 and EX1')
legend('Error of X','X') 

figure(9)
plot(XTX1,-EY1)
hold on
plot(XTX1,Y1)
hold off
title('Alpha=15 Y1 vs EY1 over Time')
xlabel('Samples')
ylabel('Y1 and EY1')
legend('Error of Y','Y') 

figure(10)
plot(XTX1,-EZ1)
hold on
plot(XTX1,Z1)
hold off
title('Alpha=15 Z1 vs Error over Time')
xlabel('Samples')
ylabel('Z1 & EZ1')
legend('Error of Z','Z') 
figure(11)
plot(XTX1,T)
title('Alpha=15 Sampling Time')
xlabel('Samples')
ylabel('Sampling Time')

figure(12)
plot(Y1(35000:N),X1(35000:N))
title('Alpha=15 X Y Phase Plot')
xlabel('X1')
ylabel('Y1')

figure(13)
% hold on
plot3(X1(40000:N),Y1(40000:N),Z1(40000:N))
title('Alpha=15 X Y Phase Plot')
xlabel('X1')
ylabel('Y1')
zlabel('Z1')