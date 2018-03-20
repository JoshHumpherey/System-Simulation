%Problem 9F
%System Simulation

N=10001;
t=linspace(0,10,N);
T=.0001;
U=ones(1,N);
X1=zeros(1,N);
X2=zeros(1,N);
X3=zeros(1,N);
X4=zeros(1,N);
Y=zeros(1,N);
Z=zeros(1,N);
FX1=zeros(1,N);
FX2=zeros(1,N);
FX3=zeros(1,N);
FX4=zeros(1,N);

FY=zeros(1,N);

num=0.085;
den=[1 .4174 1.0871 .2805 .1512];
[A,B,C,D]=tf2ss(num,den);


for k= 1:N-2
FX1(k+1)= -.4174.*X1(k)-1.0871.*X2(k)-.2805.*X3(k)-.1512.*X4(k)+U(k);
FX2(k+1)= X1(k);
FX3(k+1)= X2(k);
FX4(k+1)= X3(k);
Y(k+1)=.085.*X4(k);
   
%X(k+2)= X(k+1)+ (T./2)*(3*FX(k+1)-FX(k));
Z(k+2)= Z(k+1)+ (T./2)*(3*Y(k+1)-Y(k));

end

        figure (1)
        plot(t,Y);
        xlabel('x-values')
        ylabel('y-values')
        title('HW 9F - AB-2') 