%Problem 7B
%System Simulation

N=10000001;
t=linspace(0,15,N+1);
T=.0001;

X=zeros(1,N);
Y=zeros(1,N);
Z=zeros(1,N);
FX=zeros(1,N);
FY=zeros(1,N);
FZ=zeros(1,N);

X(1)=1;
Y(1)=2;
Z(1)=10;


for k= 1:N-5
FX(k+3)= 10*(Y(k)-X(k));
FY(k+3)= -X(k)*Z(k)+28*X(k)-Y(k);
FZ(k+3)=  X(k)*Y(k)-(8/3)*Z(k);
   
X(k+4)= X(k+3)+ (T./24)*(55*FX(k+3)-59*FX(k+2)+37*FX(k+1)-9*FX(k));
Y(k+4)= Y(k+3)+ (T./24)*(55*FY(k+3)-59*FY(k+2)+37*FY(k+1)-9*FY(k));
Z(k+4)= Z(k+3)+ (T./24)*(55*FZ(k+3)-59*FZ(k+2)+37*FZ(k+1)-9*FZ(k));
end

        figure (1)
        plot3(X,Y,Z);
        xlabel('x-values')
        ylabel('y-values')
        title('HW 7 - Lorenz System using AB-4') 