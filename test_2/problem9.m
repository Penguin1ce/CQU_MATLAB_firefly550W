syms x
fun = x.^3 + exp(-x) + sin(x/2);
fun_p = diff(fun,x);
% 转换为 MATLAB 函数句柄
fun = matlabFunction(fun);
fun_p = matlabFunction(fun_p);
x = -5:0.01:5;
y1 = fun(x);
y2 = fun_p(x);
figure
plot(x,y1,'b',x,y2,'r');
xlabel('x');
ylabel('y');
grid on;