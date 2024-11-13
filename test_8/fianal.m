clear; clc

% 年份
years = 1976:2024;
%输入拟合多项式的系数
n = 6;

each_years_count = [1 0 1 3 7 15 21 35 45 90 106 162 191 241 246 311 380 351 463 ...
    494 538 595 639 724 838 958 1205 1522 2129 2818 3702 4466 4937 5186 5670 ...
    6093 6613 6968 7642 8034 9117 9781 11000 12700 14900 18000 20900 ...
    23600 13700]; 
% 线性回归拟合
p = polyfit(years, each_years_count, n); % 1表示线性

% 计算拟合值
fitted_values = polyval(p, years);

% 计算方差
residuals = each_years_count - fitted_values; % 残差
variance = var(residuals); % 计算方差

% 绘制结果
figure;
plot(years, each_years_count, 'o', 'MarkerSize', 8, 'DisplayName', '原始数据');
hold on;
plot(years, fitted_values, '-', 'LineWidth', 2, 'DisplayName', '拟合线');
xlabel('年份');
ylabel('文献数量');
title('文献数量年度线性回归拟合');
legend;
grid on;

% 显示方差
fprintf('方差: %.4f\n', variance);
% 计算R^2值
SS_res = sum((each_years_count - fitted_values).^2); % 残差平方和
SS_tot = sum((each_years_count - mean(each_years_count)).^2); % 总平方和
R_squared = 1 - (SS_res / SS_tot); % R^2值
% 显示R^2值
fprintf('R^2 = %.4f\n', R_squared);