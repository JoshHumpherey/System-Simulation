% System Simulation Problem 2
% Written by Josh Humphrey

%% Part A
% Assume a ZOH function that lasts for one half second
zoh = zeros(1,1000);
for count = 1:100
    if count < 50
        if count < 15
            zoh(1,count) = 0.5;
        end
        if count >= 15 && count < 35
            zoh(1,count) = 1;
        end
        if count >= 35 && count < 50
            zoh(1, count) = 0.5;
        end
    else
        zoh(1,count) = 0;
    end
    
end
    
ykm4 = 0;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;
ekm3 = 0;
ekm2 = 0;
ekm1 = 0;
ek = zoh;

for i = 1:100
    yk = (77.376*ekm2+189.904*ekm1+16.16*ek(i)-ykm4-14*ykm3-99.862*ykm1)*(1/285.32);
    ykm4 = ykm3;
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
    ekm3 = ekm2;
    ekm2 = ekm1;
    ekm1 = ek;
end

    figure(1)
    plot(yk)
    title('Part A')
    xlim([0,100])
    xlabel('Time in Milliseconds')
    ylabel('Y(k): Response Magnitude')
    
%% Part B
stepVector = ones(1,100);
ykm4 = 0;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;
ekm3 = 0;
ekm2 = 0;
ekm1 = 0;
ek = stepVector;

for i = 1:100
    yk = (77.376*ekm2+189.904*ekm1+16.16*ek(i)-ykm4-14*ykm3-99.862*ykm1)*(1/285.32);
    ykm4 = ykm3;
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
    ekm3 = ekm2;
    ekm2 = ekm1;
    ekm1 = ek;
    ek = stepVector-ykm1;
end

    figure(2)
    plot(yk)
    title('Part B')
    xlim([0,100])
    xlabel('Time in Milliseconds')
    ylabel('E(k): Response Magnitude')

%% Part C
toh = zeros(1,1000);
i = 1;
for count = 1:100
    if count < 50
        if count < 25
            toh(1, count) = count/25;
        end
        if count > 25

            toh(1, count) = toh(25-i);
            i = 1 + i;
        end
        if count == 25
            toh(1, count) = 1;
        end
    else
        toh(1,count) = 0;
    end
    
end
    
ykm4 = 0;
ykm3 = 0;
ykm2 = 0;
ykm1 = 0;
ekm3 = 0;
ekm2 = 0;
ekm1 = 0;
ek = toh;

for i = 1:100
    yk = (77.376*ekm2+189.904*ekm1+16.16*ek(i)-ykm4-14*ykm3-99.862*ykm1)*(1/285.32);
    ykm4 = ykm3;
    ykm3 = ykm2;
    ykm2 = ykm1;
    ykm1 = yk;
    ekm3 = ekm2;
    ekm2 = ekm1;
    ekm1 = ek;
end

    figure(3)
    plot(yk)
    title('Part C')
    xlim([0,100])
    xlabel('Time in Milliseconds')
    ylabel('Y(k): Response Magnitude')
    
%% Part D
% No clue