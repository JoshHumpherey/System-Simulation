%Problem 2
%System Simulation

T=linspace(1,101,3);
s=zeros(1,100);
Y(1)= 0;
E(1)= 0;

hold on
for t=1:6 
TEMP=1-dirac(t-T);
end
% 
% for k=1:100
%         Y(k+3)+14.211*Y(k+2)+49.876*Y(k+1)+105.348*Y(k)+276.88*Y(k-1)=73.376*E(k+1)+189.90*E(k)+16.16*E(k-1)
%             %Plot Results
%         plot(T,Y(k),'-o');
%         xlabel('x-values')
%         ylabel('y-values')
%         title('Difference Equation')
% end    
