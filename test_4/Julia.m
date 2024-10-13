function [M] = Julia(zMax,c,N)
    % 生成500个在[-zMax, zMax]之间的点
    real_values = linspace(-zMax, zMax, 500);  % 实部
    imag_values = linspace(-zMax, zMax, 500);  % 虚部
    
    % 生成网格
    [X, Y] = meshgrid(real_values, imag_values);
    
    % 将实部和虚部组合成复数矩阵 Z
    Z = X + 1i * Y;  % X 作为实部，Y 作为虚部
    M = zeros(500, 500);
    % 对 Z 的每个元素计算逃逸速度，并存储到 M 中
    for i = 1:size(Z, 1)
        for j = 1:size(Z, 2)
            % 计算每个复数 Z(i,j) 的逃逸速度
            M(i, j) = escapevelocity(Z(i, j), c, N);  % 调用 escapevelocity 函数
        end
    end
    M_transformed = atan(0.1 * M);
    imagesc(M_transformed);
    colormap('hot');  % 设置颜色映射
    colorbar;  % 显示颜色条
    axis xy;  % 防止 y 轴翻转
    axis equal
    title(sprintf('zMax = %.2f, c = %.2f + %.2fi, N = %d', zMax, real(c), imag(c), N));
end


