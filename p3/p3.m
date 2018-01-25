% System Simulation Problem 3
% Written by Josh Humphrey

z = linspace(0.5,100);
deltaT = 0.01;
s = (1./deltaT).*log(z);
Hz_approx = (50*(-s.^2+33.3333*s+13333.3))./(s.^3+185.333*s.^2+12133.3*s+693333);

for t = 0:5
    figure(1)
    plot(Hz_approx*unitStep(t))
    title('Step Response')
    xlim([0;30])
    xlabel('time (seconds)')
    ylabel('Step Response Magnitude')
end

z = linspace(-5,5,200);
s = (1./deltaT).*log(z);
Hz_approx = (50*(-s.^2+33.3333*s+13333.3))./(s.^3+185.333*s.^2+12133.3*s+693333);


for t = -5:5
    figure(2)
    plot(Hz_approx)
    title('Impulse Response')
    xlim([-1;1])
    ylim([-0.1,0.3])
    xlabel('time (seconds)')
    ylabel('Impulse Response Magnitude')
end
