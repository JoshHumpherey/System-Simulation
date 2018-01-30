% System Simulation Problem 2
% Written by Josh Humphrey

%% Part A
yk_results = zeros(1,100);
hold on
for n = 1:100
    yk_results(1,n) = (4.76837*10^-14)*(1.22399*10^12)*n-(16941.8*2.^(n+31))*(44053.^(-n-1)+(9.25804*10^9)*(3.^(-n))*(8.^(n+1))*625.^(n+2)*90997.^(-n-1)+2.05629*10^12);
end

figure(1)
plot(yk_results)
title('Part A')
xlabel('time')
ylabel('response magnitude')
hold off

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
    xlabel('k');
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
    xlabel('k');
    ylabel('Y(k): Response Magnitude')
    
%% Part D
% No clue