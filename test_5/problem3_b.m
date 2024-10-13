clc;clear;
G = 1;          
m1 = 0.3;       
m2 = 0.03;      
odefun = @(t, Y) [Y(3);  % x1' = vx1
                  Y(4);  % y1' = vy1
                  Y(7);  % x2' = vx2
                  Y(8);  % y2' = vy2
                  -G * m2 * (Y(1) - Y(5)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5;  % vx1'
                  -G * m2 * (Y(2) - Y(6)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5;  % vy1'
                  -G * m1 * (Y(1) - Y(5)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5;   % vx2'
                  -G * m1 * (Y(2) - Y(6)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5];  % vy2'

tspan = [0 10];
y0 = [2; 2; 0; 0; 0.2; -0.2; -0.01; 0.01];

[t, Y] = ode45(odefun, tspan, y0);

plot(Y(:,1), Y(:,2), 'b', 'LineWidth', 2);  % 物体1
hold on;
plot(Y(:,3), Y(:,4), 'r', 'LineWidth', 2);  % 物体2
hold on;
xlabel('x');
ylabel('y');
legend('m1', 'm2');
grid on;
axis equal;