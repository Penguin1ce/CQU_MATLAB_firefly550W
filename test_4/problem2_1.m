clear;clc
fun1 = @(x) exp(x)-3*x;
fzero(fun1,1)
[ans1] = fsolve(fun1,1);
