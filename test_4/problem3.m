clear; clc;
% 定义方程组
% 方程 1: x + y^2 = 13
% 方程 2: ln(2x + y) - x^y + 2 = 0
fun = @(v) [v(1) + v(2)^2 - 13;            
            log(2*v(1) + v(2)) - v(1)^v(2) + 2]; 
% 生成随机初始值
num = 100; % 尝试次数
solutions = zeros(num, 2); % 用于存储解
% 生成范围在[-10, 10]的随机数
initial = rand(num, 2) * 20 - 10; 
for i = 1:num
    % 使用 fsolve 解决方程组
    options = optimset('Display', 'off'); % 关闭输出
    x0 = initial(i, :); % 随机初始值
    solutions(i, :) = fsolve(fun, x0, options); % 记录解
end
% 输出所有解
disp('随机初始值对应的解：');
disp(solutions);
