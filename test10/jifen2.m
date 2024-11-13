clear;clc
f = @(x, y) x .* y;                % 使用函数句柄定义被积函数
x_min = 0;                         % x 的积分下限
x_max = 2;                         % x 的积分上限
y_min = 0;                         % y 的积分下限
y_max = 3;                         % y 的积分上限

I = integral2(f, x_min, x_max, y_min, y_max); % 计算二重积分
disp(I);                           % 输出结果
