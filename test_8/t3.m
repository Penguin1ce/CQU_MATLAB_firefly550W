clear; clc

% 年份
years = 1976:2024;

each_years_count = [1 0 1 3 7 15 21 35 45 90 106 162 191 241 246 311 380 351 463 ...
    494 538 595 639 724 838 958 1205 1522 2129 2818 3702 4466 4937 5186 5670 ...
    6093 6613 6968 7642 8034 9117 9781 11000 12700 14900 18000 20900 ...
    23600 13700]; 
% 确保数据长度一致
assert(length(years) == length(each_years_count), '年份和文献数量数组长度不一致');

% 进行线性回归
p = polyfit(years, each_years_count, 5); % 一次多项式拟合（线性拟合）

% 计算拟合值
fitted_counts = polyval(p, years);

% 绘制结果
figure;
hold on;
plot(years, each_years_count, 'o', 'DisplayName', '实际文献数量'); % 实际数据
plot(years, fitted_counts, '-', 'DisplayName', '拟合结果'); % 拟合曲线
xlabel('年份');
ylabel('文献数量');
title('文献数量对数回归拟合');
legend show;
grid on;
hold off;
