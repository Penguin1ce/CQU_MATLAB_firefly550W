clc;clear
syms y(x)
Dy = diff(y,x) == y + 2*x;
Y = dsolve(Dy, y(0) == 1);
disp(Y)
Y_num = matlabFunction(Y);
x = -10:0.01:10;
plot(x,Y_num(x))