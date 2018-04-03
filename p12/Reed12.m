%Problem 12
%System Simulation

N=10000001;
t=linspace(0,10,N);
T=.00001;

X=zeros(1,N);
Y=zeros(1,N);
Z=zeros(1,N);
FX=zeros(1,N);
FY=zeros(1,N);
FZ=zeros(1,N);
XP1=zeros(1,N);
YP1=zeros(1,N);
ZP1=zeros(1,N);
FXP1=zeros(1,N);
FYP1=zeros(1,N);
FZP1=zeros(1,N);
XP2=zeros(1,N);
YP2=zeros(1,N);
ZP2=zeros(1,N);
FXP=zeros(1,N);
FYP=zeros(1,N);
FZP=zeros(1,N);
XC= zeros(1,N);
YC=zeros(1,N);
ZC=zeros(1,N);
FXC=zeros(1,N);
FYC=zeros(1,N);
FZC=zeros(1,N);





a=0.01;
X(1)=.01;
Y(1)=.01;
Z(1)=.01;


for k= 1:N-1
%Predict derivative
FX(k)= a*(Y(k)+(X(k)-2*X(k)^3)/7);
FY(k)= X(k)-Y(k)+Z(k);
FZ(k)= -(100/7)*Y(k);
%Predict Forward Eular
XP2(k+1)= X(k) +T*FX(k);
YP2(k+1)= Y(k) +T*FY(k);
ZP2(k+1)= Z(k) +T*FZ(k);
%Evaulate 
FXP(k)= a*(YP2(k)+(XP2(k)-2*XP2(k)^3)/7);
FYP(k)= XP2(k)-YP2(k)+ZP2(k);
FZP(k)= -(100/7)*YP2(k);
%Correct Forward Eular
XC(k+1)= XC(k) +T*FXP(k);
YC(k+1)= YC(k) +T*FYP(k);
ZC(k+1)= ZC(k) +T*FZP(k);

%Predict CORRECT derivative
FXC(k)= a*(YC(k)+(XC(k)-2*XC(k)^3)/7);
FYC(k)= XC(k)-YC(k)+ZC(k);
FZC(k)= -(100/7)*YC(k);

%Evaulate Trapezoidal Rule
XP1(k+1)=2*FXC(k+1)-2*FXC(k)-XP1(k);
YP1(k+1)=2*FYC(k+1)-2*FYC(k)-YP1(k);
ZP1(k+1)=2*FZC(k+1)-2*FZC(k)-ZP1(k);
%Correct
FXP1(k)= a*(YP1(k)+(XP1(k)-2*XP1(k)^3)/7);
FYP1(k)= XP1(k)-YP1(k)+ZP1(k);
FZP1(k)=  -(100/7)*YP1(k);
%Evaluate 
 X(k+1)=2*FXP1(k+1)-2*FXP1(k)-X(k);
 Y(k+1)=2*FYP1(k+1)-2*FYP1(k)-Y(k);
 Z(k+1)=2*FZP1(k+1)-2*FZP1(k)-Z(k);
end

        figure (1)
        plot3(X,Y,Z);
        xlabel('x-values')
        ylabel('y-values')
        title('HW 12 - Chuas System') 
%         
%                figure (2)
%         plot(t,X);
%         xlabel('x-values')
%         ylabel('y-values')
%         title('HW 11 - Sprotts Simple chaotic System Time Response X') 
%         
%         
%                figure (3)
%         plot(t,Y);
%         xlabel('x-values')
%         ylabel('y-values')
%         title('HW 11 - Sprotts Simple chaotic System Time Response Y')
%         
%                        figure (4)
%         plot(t,Z);
%         xlabel('x-values')
%         ylabel('y-values')
%         title('HW 11 - Sprotts Simple chaotic System Time Response Z')