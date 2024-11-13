clear;clc
syms x;                  % 定义符号变量
f = x^2*0.25*(x+1);       % 定义被积函数
a = 0;                   % 积分下限
b = 2;                   % 积分上限
F = int(f, x, a, b);     % 计算定积分
disp(F);                 % 输出结果
disp(5/3-(49/36))