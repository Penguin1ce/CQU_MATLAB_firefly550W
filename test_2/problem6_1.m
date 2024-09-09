[x,y] = meshgrid(-5:0.1:5,-5:0.1:5);
z = sin(pi*sqrt(x.^2+y.^2));
figure
surf(x,y,z);
colorbar