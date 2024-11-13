clear; clc

% 年份
years = 1976:2024;

% 每年的文献数量（示例数据，替换为你的数据）
each_years_count = [1 0 1 3 7 15 21 35 45 90 106 162 191 241 246 311 380 351 463 ...
    494 538 595 639 724 838 958 1205 1522 2129 2818 3702 4466 4937 5186 5670 ...
    6093 6613 6968 7642 8034 9117 9781 11000 12700 14900 18000 20900 ...
    23600 13700]; 
each_years_count_reversed = flip(each_years_count);

% 确保每年都有对应的文献数量
if length(each_years_count) ~= length(years)
    error('文献数量的长度与年份长度不一致！');
end

% 线性回归
p = polyfit(years, each_years_count, 1); % 1表示线性拟合
fitted_values = polyval(p, years); % 计算拟合值

% 绘制结果
figure;
plot(years, each_years_count, 'ro-', 'MarkerFaceColor', 'r'); % 原始数据点
hold on;
plot(years, fitted_values, 'b-', 'LineWidth', 2); % 拟合线
xlabel('年份');
ylabel('文献数量');
title('文献数量按年度的回归拟合');
legend('原始数据', '线性拟合', 'Location', 'NorthWest');
grid on;
hold off;

% 输出回归系数
fprintf('线性回归方程: y = %.4fx + %.4f\n', p(1), p(2));
