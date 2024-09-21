clear; clc;

% 读取数据
A = xlsread('cumcm2011A.xls', 1, 'A4:E322');

x = A(:, 2); % 提取X坐标
y = A(:, 3); % 提取Y坐标
z = A(:, 4); % 提取高度（Z）

% 创建规则的网格以进行插值
nx = 1000;
ny = 10000;
% px = linspace(0, 30000, nx);
% py = linspace(0, 30000, ny);
px = linspace(0, 30000);
py = linspace(0, 30000);
[X, Y] = meshgrid(px, py);

% 使用griddata进行插值
%Z = griddata(x, y, z, X, Y, 'linear'); 
Z = griddata(x, y, z, X, Y, 'cubic'); 
% 可以尝试不同的插值方法，比如 'linear' 或 'cubic'

% 作图
figure;

% 地貌图
%subplot(1, 2, 1); % 子图1
scatter(x,y,5,z);
surf(X, Y, Z);    % 使用surf绘制三维地貌图
%mesh(X,Y,Z);
title('地貌图');
xlabel('X 坐标');
ylabel('Y 坐标');
zlabel('高度');
shading interp;   % 平滑色彩
colorbar;


% 等高线图
%subplot(1, 2, 2); % 子图2
figure;
contourf(X, Y, Z, 40); % 使用contourf绘制等高线图，40代表等高线的数量
title('等高线图');
xlabel('X 坐标');
ylabel('Y 坐标');
colorbar;
