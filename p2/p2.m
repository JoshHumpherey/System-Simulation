% System Simulation Problem 2
% Written by Josh Humphrey
zoh = [0.5,1,0.5,0,0,0,0,0,0,0];

%% Part A
ykm4 = 0;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;
ekm3 = 0;
ekm2 = 0;
ekm1 = 0;
ek = zoh;

for i = 1:10
    yk = (77.376*ekm2+189.904*ekm1+16.16*ek(i)-ykm4-14*ykm3-99.862*ykm1)*(1/285.32);
    ykm4 = ykm3;
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
    ekm3 = ekm2;
    ekm2 = ekm1;
    ekm1 = ek;
end

plot(yk)
%% Part B

