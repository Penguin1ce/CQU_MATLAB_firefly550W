clc;clear
odefun = @(t,Y) [Y(2);
                (-3*Y(1))/(Y(1)^2+Y(3)^2)^1.5;
                 Y(4);
                (-3*Y(3))/(Y(1)^2+Y(3)^2)^1.5];
tspan = [0 10];
% x'0, x''0  
y0 = [0 1 2 0];
[t, Y] = ode45(odefun, tspan, y0);
plot(Y(:,1),Y(:,3),LineWidth=2);  
% Y(:,1) 是 x, Y(:,3) 是 y
axis on
grid on

