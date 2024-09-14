% 观测点数据
x_data = [5.764, 6.286, 6.759, 7.168, 7.408];
y_data = [0.648, 1.202, 1.823, 2.526, 3.360];

% 定义非线性方程，anss = [c_x, c_y, a]
fun = @(anss) arrayfun(@(x, y) sqrt(x.^2 + y.^2) + sqrt((x - anss(1)).^2 + (y - anss(2)).^2) - 2*anss(3), ...
    x_data, y_data);

% 初始猜测 [c_x, c_y, a]
init_guess = [1, 1, 5]; % 修改初始猜测，确保符合可能的焦点位置和长半轴长度

% 使用 fsolve 求解
ans_sol = fsolve(fun, init_guess);

% 输出解
c_x = ans_sol(1);  % 第二焦点的 x 坐标
c_y = ans_sol(2);  % 第二焦点的 y 坐标
a = ans_sol(3);    % 长半轴长度

disp(['第二焦点坐标: (', num2str(c_x), ', ', num2str(c_y), ')']);
disp(['长半轴长度 a = ', num2str(a)]);

% 计算短半轴长度 b
c = sqrt(c_x.^2 + c_y.^2)/2;  % 焦点到原点的距离
b = sqrt(a.^2 - c.^2);  % 根据椭圆的几何关系计算短半轴 b
cx = c_x/2;
cy = c_y/2;
% 绘制椭圆
t = linspace(0, 2*pi, 100);  % 角度范围
t2 = atan(ans_sol(2)/ans_sol(1));
x_ellipse = cx + a * cos(t)*cos(t2)-b*sin(t)*sin(t2);  % 椭圆的 x 坐标
y_ellipse = cy+ a*cos(t)*sin(t2)+b*sin(t)*cos(t2);  % 椭圆的 y 坐标

% 绘制结果
figure;
hold on;
plot(x_ellipse, y_ellipse, 'b', 'LineWidth', 1);  % 绘制椭圆

scatter(x_data, y_data, 'r', 'filled');  % 绘制观测点
scatter([0, c_x], [0, c_y], 'g', 'filled');  % 绘制两个焦点
title('椭圆和观测点');
xlabel('X');
ylabel('Y');
axis equal;
grid on;

% 标记焦点位置
text(0, 0, 'F_1(0,0)', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(c_x, c_y, ['F_2(', num2str(c_x), ',', num2str(c_y), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
