syms x
%fun = x.^3 + 2*x.^2 -1;
fun = sqrt(x.^3) + exp(-x) + sin(x/2);
fun_p = diff(fun,x);
% 转换为 MATLAB 函数句柄
fun = matlabFunction(fun);
fun_p = matlabFunction(fun_p);
x = -10:0.01:10;
y1 = fun(x);
y2 = fun_p(x);
figure
plot(x,y1,'b',x,y2,'r');
xlabel('x中文测试');
ylabel('y');
grid on;