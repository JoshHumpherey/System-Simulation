% System Simulation Problem 2
% Written by Josh Humphrey

% Assume a ZOH function that lasts for one half second
zoh = zeros(1000);
for count = 1:1000;
    if count < 15
        zoh(count) = 0.5;
    end
    if count > 15 && count < 35
        zoh(count) = 1;
    end
    if count >= 35 && count < 50
        zoh(count) = 0.5;
    end
end
    

%% Part A
ykm4 = 0;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;
ekm3 = 0;
ekm2 = 0;
ekm1 = 0;
ek = zoh;
hold on
for i = 1:1000
    yk = (77.376*ekm2+189.904*ekm1+16.16*ek(i)-ykm4-14*ykm3-99.862*ykm1)*(1/285.32);
    ykm4 = ykm3;
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
    ekm3 = ekm2;
    ekm2 = ekm1;
    ekm1 = ek;
    
    plot(yk, 'o')
    
end
hold off

