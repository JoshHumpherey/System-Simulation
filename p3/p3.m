% System Simulation Problem 3
% Written by Josh Humphrey


t = linspace(0,5,100);
s = (1./t).*log(z);
Hz_approx = (50*(-s.^2+33.3333*s+13333.3))./(s.^3+185.333*s.^2+12133.3*s+693333);

for t = 0:5
    plot(Hz_approx*unitStep(t))
    title('Step Response')
    xlim([0;30])
    xlabel('z-value')
    ylabel('Step Response Magnitude')
end

t = linspace(-5,5,100);
s = (1./t).*log(z);
Hz_approx = (50*(-s.^2+33.3333*s+13333.3))./(s.^3+185.333*s.^2+12133.3*s+693333);

for t = -5:5
    plot(Hz_approx)
    title('Impulse Response')
    xlim([-5;5])
    xlabel('z-value')
    ylabel('Impulse Response Magnitude')
end