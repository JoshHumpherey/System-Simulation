%Problem 9
%System Simulation

Omega=linspace(0,2*pi,10001);      %Set up vector of Omega
z=exp(1i*Omega);                  %Define z on unit circle
T=.0001;
H=(.0850*z.^4)./(2.9362*z.^4-7.7069*z.^3+8.3393*z.^2-4.4174*z+1);     %Calculate the values of H on the unit circle
       
figure (1)
        plot(Omega,abs(H));
        xlabel('x-values')
        ylabel('y-values')
        title('HW 9 - Frequency Response (Mag)')
        
        figure (2)
        plot(Omega,angle(H));
        xlabel('x-values')
        ylabel('y-values')
        title('HW 9 - Frequency Response (Angle)')
        
         
%hold on        
% N=100;
% t=linspace(0,1,N);
% for s= 1:N
%     G(s)=.085/(s^4+.4174*s^3+1.0871*s^2+.2805*s+.1512);
% end
% 
% figure (1)
% plot (t,abs(G))
% 
% figure (2)
% plot (t,angle(G))