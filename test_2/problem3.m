% 加载 mitMap.mat 文件
load mitMap.mat

% 创建 2x2 网格的图形窗口
figure;

% 1. 左上角图像，坐标轴设置为 square
subplot(2, 2, 1); % 第一个子图
image(mit); % 显示图像
colormap(cMap); % 设置颜色表为 cMap
axis square; % 坐标轴设置为 square
title('Square'); % 添加标题
% 2. 右上角图像，坐标轴设置为 tight
subplot(2, 2, 2);
image(mit);
colormap(cMap); % 设置颜色表为 cMap
axis tight; % 坐标轴设置为 tight
title('Tight'); % 添加标题

% 3. 左下角图像，坐标轴设置为 equal
subplot(2, 2, 3);
image(mit);
colormap(cMap); % 设置颜色表为 cMap
axis equal; % 坐标轴设置为 equal
title('Equal'); % 添加标题

% 4. 右下角图像，坐标轴设置为 xy(axis square, axis tight, 等等.)
subplot(2, 2, 4);
image(mit);
colormap(cMap); % 设置颜色表为 cMap
axis xy; % 坐标轴设置为 xy
title('XY'); % 添加标题