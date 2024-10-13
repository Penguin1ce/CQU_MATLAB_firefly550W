clc;clear
odefun = @(x, Y) [Y(2); -Y(1)*cos(x)];
tspan = [0 10];
% 初始条件 [y(0), y'(0)]
y0 = [1; 0];
[x, Y] = ode23(odefun, tspan, y0);
plot(x, Y(:,1),LineWidth=2) % 只绘制y1（即y）
xlabel('x')
ylabel('y(x)')
axis on
grid on