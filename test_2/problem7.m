% 观测点数据
x_data = [5.764, 6.286, 6.759, 7.168, 7.408];
y_data = [0.648, 1.202, 1.823, 2.526, 3.360];

fun = @(anss) arrayfun(@(x,y) sqrt(x.^2+(y-anss(1)).^2)+sqrt(x.^2+y.^2)-2*anss(2),...
    x_data,y_data);
init_guess = [17,30];
ans_sol = fsolve(fun,init_guess);
c = ans_sol(1)*0.5;
a = ans_sol(2);
fprintf('a = %.3f\n',a);

b = sqrt(a.^2-c.^2);
fprintf('b = %.3f\n', b);
fprintf('c = %.3f\n', c);
theta = linspace(0, 2*pi, 1000);

% 椭圆方程
x_ellipse = b * cos(theta);
y_ellipse = a * sin(theta);

% 平移椭圆使焦点位于原点（太阳的位置）
y_ellipse_shifted = y_ellipse + c;

% 绘制图形
figure;
plot(x_ellipse, y_ellipse_shifted, 'b-', 'LineWidth', 2); % 椭圆轨道
hold on;
plot(x_data, y_data, 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % 观测点

% 标注
title('小行星轨道图');
xlabel('x (天文单位)');
ylabel('y (天文单位)');
legend('小行星轨道', '观测点', 'Location', 'Best');
axis equal;
grid on;
