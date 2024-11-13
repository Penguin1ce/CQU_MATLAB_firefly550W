% 定义代理点坐标、需求量和拥有量
X = [0, 20, 18, 30, 35, 33, 5, 5, 11, 2];
Y = [0, 20, 10, 12, 0, 25, 27, 10, 0, 15];
demand = [10, 6, 8, 11, 9, 7, 15, 7, 9, 12];
supply = [9, 14, 5, 9, 13, 3, 15, 11, 15, 7];

% 计算需求量与拥有量的差异
net_demand = demand - supply;

% 将正的部分视为需求，将负的部分视为剩余
demand_points = find(net_demand > 0);
supply_points = find(net_demand < 0);

% 创建优化问题
num_demand = length(demand_points);
num_supply = length(supply_points);

% 构建成本矩阵（加权欧氏距离）
cost = zeros(num_demand, num_supply);
for i = 1:num_demand
    for j = 1:num_supply
        d_i = demand_points(i);
        s_j = supply_points(j);
        cost(i, j) = 1.3 * sqrt((X(d_i) - X(s_j))^2 + (Y(d_i) - Y(s_j))^2);
    end
end

% 将成本矩阵展平成向量
f = cost(:);

% 构建约束矩阵
Aeq = zeros(num_demand + num_supply, num_demand * num_supply);
beq = [net_demand(demand_points), -net_demand(supply_points)]';

% 设置约束，使得从供应点流出的总量等于需求点所需的总量
for i = 1:num_demand
    Aeq(i, (i-1)*num_supply + 1:i*num_supply) = 1;
end

for j = 1:num_supply
    Aeq(num_demand + j, j:num_supply:end) = 1;
end

% 下界（所有变量都必须为非负）
lb = zeros(num_demand * num_supply, 1);

% 使用线性规划求解
options = optimoptions('linprog', 'Algorithm', 'interior-point', 'Display', 'none');
[x, fval, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], options);

% 检查求解状态并输出结果
if exitflag == 1
    disp('总最小里程数:');
    disp(fval);
    disp('调度方案:');
    result = reshape(x, [num_supply, num_demand])';
    disp(result);
else
    disp('线性规划问题没有可行解。');
end
