figure
subplot(1,3,1)
theta = 0:0.01:10*pi;
polar = cos(3.5*theta);
polarplot(theta,polar);
title('\rho = cos(7\theta / 2)');

subplot(1,3,2)
f = @(x,y) x.*sin(x)+y.*sin(y);
fimplicit(f,[-30 30 -30 30]);
title('x*sin(x) + y*sin(y) = 0');

subplot(1,3,3)
xt = @(t) sin(t);
yt = @(t) sin(t/2);
fplot(xt,yt,[0 4.*pi]);
title('x = sin(t), y = sin(t)/2');
% 调整图形布局
axis equal