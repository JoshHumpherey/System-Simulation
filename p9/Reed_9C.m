%Problem 9
%System Simulation
%AB-2

Omega=linspace(0,2*pi,10001);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=.0001;
H=(2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1)./(.0850*z.^4); %Calculate the values of H on the unit circle
        plot(real(H),imag(H));
        xlabel('x-values')
        ylabel('y-values')
        title('HW 9 - AB-2') 