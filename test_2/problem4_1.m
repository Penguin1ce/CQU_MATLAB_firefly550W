figure
colors = jet(5);
hold on
for i = 1:5
    [x,y] = getCircle([0,0],i);
    plot(x, y, 'LineWidth', 5, 'Color', colors(i,:));
%     plot(x, y, 'LineWidth', 2, 'Color', colors{i});
%     不能这么写
%     colors = jet(5);: jet(5) 生成一个 5x3 的矩阵，每一行代表一种颜色的 RGB 值。
%     colors(i, :): 使用矩阵索引来选择第 i 行的颜色值。
%     这是正确的方式来从颜色矩阵中提取颜色。
%     使用 colors(i, :) 作为 plot 函数的 'Color' 属性值，MATLAB 将能够正确识别并应用这些颜色。
end
axis equal