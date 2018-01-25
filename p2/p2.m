% System Simulation Problem 2
% Written by Josh Humphrey

deltaT = 0.01;
s = linspace(0,100,100);
zoh = (1-exp(-s*deltaT));
Compensator = (4*s+10)./(s+10);
Actuator = 4./(s+4);
Airframe = (4.586*s+0.404)./(s.^2+0.211*s+6.922);

%% Part A
PlaneTransferFunction = Compensator.*Actuator.*Airframe;
for t = 0:100
    figure(1)
    title('Part A Plot')
    plot(PlaneTransferFunction.*zoh)
    xlabel('time (seconds)')
    ylabel('magnitude')
end

%% Part B

