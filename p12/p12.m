% System Simulation Problem 12
% Written by Josh Humphrey

N = 10000;
T = 0.1;
alpha = 1;

fxc = zeros(1,N);
fyc = zeros(1,N);
fzc = zeros(1,N);

xp = zeros(1,N);
yp = zeros(1,N);
zp = zeros(1,N);

fxp = zeros(1,N);
fyp = zeros(1,N);
fzp = zeros(1,N);

xc = zeros(1,N);
yc = zeros(1,N);
zc = zeros(1,N);

% Initial Conditions %
xc(1) = 1;
yc(1) = 1;
zc(1) = 1;

for k = 1:N
    % Evaluate for prediction %
    fxc(k) = alpha*(yc(k)+((xc(k)-2*(xc(k)).^3)/(yc(k))));
    fyc(k) = xc(k)-yc(k)+zc(k);
    fzc(k) = -(100/7)*yc(k);
    % Predict %
    xp(k+1) = xc(k)+T*fxc(k);
    yp(k+1) = yc(k)+T*fyc(k);
    zp(k+1) = zc(k)+T*fzc(k);
    % Evaluate for correction %
    fxp(k) = alpha*(yp(k)+((xp(k)-2*(xp(k)).^3)/(yp(k))));
    fyp(k) = xp(k)-yp(k)+zp(k);
    fzp(k) = -(100/7)*yp(k);
    % Correct %
    xc(k+1) = xc(k)+T*fxp(k);
    yc(k+1) = yc(k)+T*fyp(k);
    zc(k+1) = zc(k)+T*fzp(k);
end

figure(1)
plot3(xc,yc,zc)
title('3D Plot')
    