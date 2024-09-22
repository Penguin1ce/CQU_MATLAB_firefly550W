clear;clc
%A = input('输入元素向量  ：');
B = load('PI.mat');
num = input('输入你想查询的区域 1 2 3 4 5\n');
A = B.A;
A1 = A(num,:);
A1_sum = sum(A1);
PI_AVER = A1_sum/8;
PI_MAX = max(A1);
Pn = ((PI_AVER^2+PI_MAX^2)/2)^0.5;
disp('Pn等于：')
disp(Pn)