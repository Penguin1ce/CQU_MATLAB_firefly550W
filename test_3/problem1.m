%功能区分布散点图
clear;clc
A = xlsread('cumcm2011A.xls',1,'A4:E322');

x = A(:,2);
y = A(:,3);
z = A(:,5);
x1 = find(z==1);
x = x(x1(:));
y = y(x1(:));
scatter(x,y,20,'d');
hold on

x2 = find(z==2);
x = A(:,2);
y = A(:,3);
x = x(x2(:));
y = y(x2(:));
scatter(x,y,20,'h');
hold on

x3 = find(z==3);
x = A(:,2);
y = A(:,3);
x = x(x3(:));
y = y(x3(:));
scatter(x,y,20,'s');
hold on

x4 = find(z==4);
x = A(:,2);
y = A(:,3);
x = x(x4(:));
y = y(x4(:));
scatter(x,y,20,'p');
hold on

x5 = find(z==5);
x = A(:,2);
y = A(:,3);
x = x(x5(:));
y = y(x5(:));
scatter(x,y,20,'x');
hold on
title('功能区分布')
legend('生活区','工业区','山区','交通区','公园绿地区')


