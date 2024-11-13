clear; clc

% 年份
years = 1976:2024;

each_years_count = [1 0 1 3 7 15 21 35 45 90 106 162 191 241 246 311 380 351 463 ...
    494 538 595 639 724 838 958 1205 1522 2129 2818 3702 4466 4937 5186 5670 ...
    6093 6613 6968 7642 8034 9117 9781 11000 12700 14900 18000 20900 ...
    23600 13700]; 
% 对文献数量取对数
log_counts = log(each_years_count);

% 线性回归
p = polyfit(years, log_counts, 1); % 一次多项式拟合

% 拟合结果
fitted_log_counts = polyval(p, years);

% 绘图
figure;
hold on;
scatter(years, log_counts, 'filled', 'DisplayName', '实际数据');
plot(years, fitted_log_counts, 'r-', 'DisplayName', '对数拟合');
xlabel('年份');
ylabel('对数文献数量');
title('文献数量的对数回归拟合');
legend;
grid on;
hold off;

% 显示拟合参数
disp('拟合参数:');
disp(['斜率: ', num2str(p(1))]);
disp(['截距: ', num2str(p(2))]);
