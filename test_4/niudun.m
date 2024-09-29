function [x, fval] = niudun(fun, x0, er, max_iter)
    % niudun 使用牛顿法计算函数的根
    % 输入参数：
    %   fun      - 目标函数（匿名函数）
    %   x0       - 初始猜测值
    %   er       - 收敛精度
    %   max_iter - 最大迭代次数（可选，默认值为 100）
    
    if nargin < 4
        max_iter = 100; % 默认最大迭代次数
    end
    
    syms x;
    df = diff(fun, x); % 计算导数
    
    % 将符号函数转换为匿名函数
    fun_handle = matlabFunction(fun);
    df_handle = matlabFunction(df);
    
    % 初始化变量
    x_current = x0;
    
    for i = 1:max_iter
        f_val = fun_handle(x_current);  % 计算函数值
        df_val = df_handle(x_current);   % 计算导数值
        
        % 防止除以零
        if df_val == 0
            warning('导数为零，无法继续迭代。');
            break;
        end
        
        % 牛顿迭代公式
        x_next = x_current - f_val / df_val;
        
        % 检查是否收敛
        if abs(x_next - x_current) < er
            x = x_next;  % 返回根
            fval = f_val; % 返回在根处的函数值
            return;
        end
        
        x_current = x_next;  % 更新当前值
    end
    
    % 如果达到最大迭代次数，返回最后的近似值
    x = x_current;
    fval = fun_handle(x_current);
end
