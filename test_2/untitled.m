% 初始化结果存储
result = [];

% 遍历所有可能的组合
for A = 0:1
    for B = 0:1
        for C = 0:1
            for D = 0:1
                for E = 0:1
                    for F = 0:1
                        % 检查所有条件
                        if (A + B >= 1) && ...
                           (A ~= D) && ...
                           (A + E + F == 2) && ...
                           ((B == C) || (B == 0 && C == 0)) && ...
                           (C + D == 1) && ...
                           (~(D == 0 && E == 1)) 
                            % 满足所有条件，记录结果
                            result = [result; A, B, C, D, E, F];
                        end
                    end
                end
            end
        end
    end
end

% 输出所有符合条件的结果
disp('符合条件的罪犯组合为：');
disp(result);
