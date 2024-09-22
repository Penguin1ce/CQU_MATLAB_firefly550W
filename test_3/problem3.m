% 给出8种主要重金属元素在该城区的空间分布
% 并分析该城区内不同区域重金属的污染程度
clear; clc;
% 点击F5立即运行并自动画图
% 读取数据
A1 = xlsread('cumcm2011A.xls', 1, 'A4:E322');
A2 = xlsread('cumcm2011A.xls', 2, 'A4:I322');
A3 = xlsread('cumcm2011A.xls', 3, 'B4:B11');

A = ["1-As",'2-Cd','3-Cr','4-Cu','5-Hg','6-Ni','7-Pb','8-Zn'];
check = input(['查询 1-元素空间分布  2-污染程度' ...
    '\n:']);
if check == 1
    disp('1-As  2-Cd  3-Cr  4-Cu  5-Hg  6-Ni  7-Pb  8-Zn')
    nums = input('想要查询的元素空间分布：') + 1;
    x = A1(:, 2); % 提取X坐标
    y = A1(:, 3); % 提取Y坐标
    z = A2(:, nums); % 提取污染程度Z
    %
    % 创建规则的网格以进行插值
    nx = 1000;
    ny = 1000;
    px = linspace(0, 30000, nx);
    py = linspace(0, 30000, ny);
    [X, Y] = meshgrid(px, py);

    % 使用griddata进行插值
    Z = griddata(x, y, z, X, Y, 'cubic'); 
    % 可以尝试不同的插值方法，比如 'linear' 或 'cubic'
    % 作图
    figure;
    
    surf(X, Y, Z);    % 使用surf绘制
    %mesh(X,Y,Z);
    title(A(nums-1),'元素空间分布图');
    xlabel('X 坐标(m)');
    ylabel('Y 坐标(m)');
    if nums ~= 3 && nums ~= 5
        zlabel('μg/g');
    else
        zlabel('ng/g');
    end
    shading interp;   % 平滑色彩
    colorbar;
elseif check == 2
    B = [3.6 130 31 13.2 35 12.3 31 69];
    disp('1-As  2-Cd  3-Cr  4-Cu  5-Hg  6-Ni  7-Pb  8-Zn')
    nums = input('想要查询的元素污染情况分布：') + 1;
    x = A1(:, 2); % 提取X坐标
    y = A1(:, 3); % 提取Y坐标
    z = A2(:, nums) - B(nums-1); % 提取污染程度Z
    %
    % 创建规则的网格以进行插值
    nx = 1000;
    ny = 1000;
    px = linspace(0, 30000, nx);
    py = linspace(0, 30000, ny);
    [X, Y] = meshgrid(px, py);

    % 使用griddata进行插值
    Z = griddata(x, y, z, X, Y, 'cubic'); 
    % 可以尝试不同的插值方法，比如 'linear' 或 'cubic'
    % 作图
    figure;
    
    surf(X, Y, Z);    % 使用surf绘制
    %mesh(X,Y,Z);
    title(A(nums-1),'元素污染情况分布图');
    xlabel('X 坐标(m)');
    ylabel('Y 坐标(m)');
    if nums ~= 3 && nums ~= 5
        zlabel('μg/g');
    else
        zlabel('ng/g');
    end
    shading interp;   % 平滑色彩
    colorbar;

else
    disp('输入错误，请重新运行')
end