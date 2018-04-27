% System Simulation Problem 14
% Written by Josh Humphrey

clear
N = 10000;
t = linspace(0,10,N);
T = 0.1;
a = 0.5;
b = 0.4;
c = 0.4;
d = 0.1;
E = 0.05;
m = 1.4017;
H = 100;
V = m*H;
I = zeros(1,N);
Y = zeros(1,N);
Y(1)= 0.1;
I(1)= 0.1;

for k = 1:N-1
    IK1 = a.*c.*(V-I(k)).*(Y(k)/H)-d.*I(k);
    YK1 = a*b*I(k)*((H-Y(k))/H)-E*Y(k);

    MIDY = Y(k)+(T)*YK1;
    MIDI = I(k)+(T)*IK1;

    IK2 = a.*c.*(V-MIDI).*(MIDY/H)-d.*MIDI;
    YK2 = a*b*MIDI*((H-MIDY)/H)-E*MIDY;

    I(k+1) = I(k)+(T/2)*(IK1 + IK2);
    Y(k+1) = Y(k)+(T/2)*(YK1 + YK2);
end

title('Mosquito Disease Model: m=1.4017')
hold on
plot(t,Y)
plot(t,I)
legend('Infected Humans','Mosquito Population')
hold off