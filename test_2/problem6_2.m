[u,v] = meshgrid(0:0.1:2*pi,0:0.1:2*pi);
x = (1+cos(u)).*cos(v);
y = (1+cos(u)).*sin(v);
z = sin(u);
figure
surf(x,y,z);
colorbar;
axis equal