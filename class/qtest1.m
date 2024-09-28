clear;clc
temp = readmatrix("Z.xlsx");
A = temp(2:end,:);
x = temp(1,:);
[n,max] = size(temp);
x_new = 1:15;
for i=2:n
    y = temp(i,:);
    y_new = interp1(x,y,x_new,'spline');
    P(i-1,:) = y_new;
    plot(x_new,y_new,'b')
end
P = [1:15;P];