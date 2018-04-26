% System Simulation Problem 15
% Written by Josh Humphrey

h=1;
a = 1;
b = 1;
x = 1:h:10;
y = ones(1,length(x)); 
y(1) = 1;
F_xy = @(t,r) r;

for k=1:(length(x)-1)
    k_1 = F_xy(x(k),y(k));
    k_2 = F_xy(x(k)+0.5*h,y(k)+0.5*h*k_1);
    k_3 = F_xy((x(k)+0.5*h),(y(k)+0.5*h*k_2));
    k_4 = F_xy((x(k)+h),(y(k)+k_3*h));

    y(k+1) = y(k) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;
end

figure(1)
plot(x,y)
title('Sprott Dynamic Happiness System')

