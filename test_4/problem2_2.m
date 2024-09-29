clear;clc
p = [1 0 2 0 3 0 5 7];
X = -10:10;
Y = X.^7+2*X.^5+3*X.^3+5*X+7;
Y2 = 0;
plot(X,Y,'r')
axis on
% roots
ans_roots = roots(p);
% fzero
fun1 = @(x) x^7+2*x^5+3*x^3+5*x+7;
ans_fzero = fzero(fun1,0);
% fsolve
ans_fsolve = fsolve(fun1,0);
% 牛顿
% 使用符号变量定义目标函数
syms x;  % 定义符号变量 x
fun2 = x^7 + 2*x^5 + 3*x^3 + 5*x + 7;  % 符号表达式
% 初始猜测值与误差限
% 初始猜测为 0，误差限为 1e-6
[x_niudun, fval_niudun] = niudun(fun2, 0, 1e-6);
% 输出结果
disp('使用牛顿法找到的根:');
disp(x_niudun);
disp('在根处的函数值:');
disp(fval_niudun);
