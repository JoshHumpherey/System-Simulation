% System Simulation Problem 16
% Written by Josh Humphrey
clear
N = 10000;
T = 0.01;
t = linspace(0,T*N,N);
x = zeros(1,N);
y = zeros(1,N);
z = zeros(1,N);
Dx = zeros(1,N);
Dy = zeros(1,N);
Dz = zeros(1,N);
a = 0.5;
b = -5.6;
Dx(1) = 0.01;
Dy(1) = 0.01;
Dz(1) = 0.01;

for k=1:(N-1)
    kx1_1 = x(k);
    kx1_2 = a*(y(k)-x(k));
    ky1_1 = y(k);
    ky1_2 = -z(k)-(y(k)-x(k));
    kz1_1 = z(k);
    kz1_2 = b.*y(k);
    
    Midx1_1=x(k)+.5.*T.*kx1_1;
    Midx1_2=Dx(k)+.5.*T.*kx1_2;
    Midy1_1=y(k)+.5.*T.*ky1_2;
    Midy1_2=Dy(k)+.5.*T.*ky1_2;
    Midz1_1=z(k)+.5*T.*kz1_1;
    Midz1_2=Dz(k)+.5*T.*kz1_2;
    
    kx2_1 = Midx1_2;
    kx2_2 = -b.*(1-Midx1_1.^2) .* Midx1_2 - Midx1_1;
    ky2_1 = Midy1_2;
    ky2_2 = -b.*(1-Midy1_1.^2) .* Midy1_2 - Midy1_1;
    kz2_1 = Midz1_2;
    kz2_2 = -b.*(1-Midz1_1.^2) .* Midz1_2 - Midz1_1;
    
    Midx2_1=x(k)+.5.*T.*kx2_1;
    Midx2_2=Dx(k)+.5.*T.*kx2_1;
    Midy2_1=y(k)+.5.*T.*ky2_2;
    Midy2_2=Dy(k)+.5.*T.*ky2_2;
    Midz2_1=z(k)+.5*T.*kz2_1;
    Midz2_2=Dz(k)+.5*T.*kz2_2;
    
    kx3_1 = Midx1_2;
    kx3_2 = -b.*(1-Midx2_1.^2) .* Midx2_2 - Midx2_1;
    ky3_1 = Midy1_2;
    ky3_2 = -b.*(1-Midy2_1.^2) .* Midy2_2 - Midy2_1;
    kz3_1 = Midz1_2;
    kz3_2 = -b.*(1-Midz2_1.^2) .* Midz2_2 - Midz2_1;
    
    Midx3_1=x(k)+.5.*T.*kx3_1;
    Midx3_2=Dx(k)+.5.*T.*kx3_1;
    Midy3_1=y(k)+.5.*T.*ky3_2;
    Midy3_2=Dy(k)+.5.*T.*ky3_2;
    Midz3_1=z(k)+.5*T.*kz3_1;
    Midz3_2=Dz(k)+.5*T.*kz3_2;
    
    kx4_1 = Midx1_2;
    kx4_2 = -b.*(1-Midx3_1.^2) .* Midx2_2 - Midx3_1;
    ky4_1 = Midy1_2;
    ky4_2 = -b.*(1-Midy3_1.^2) .* Midy3_2 - Midy3_1;
    kz4_1 = Midz3_2;
    kz4_2 = -b.*(1-Midz3_1.^2) .* Midz3_2 - Midz3_1;
    
    x(k+1) = x(k)+(T/6).*(kx1_1+2.*kx2_1+2.*kx3_1+kx4_1);
    y(k+1) = y(k)+(T/6).*(ky1_1+2.*ky2_2+2.*ky3_1+ky4_1);
    z(k+1) = z(k)+(T/6).*(kz1_1+2.*kz2_2+2.*kz3_1+kz4_1);
end

figure(1)
plot3(x,y,z)
title('Folded Torus System')
