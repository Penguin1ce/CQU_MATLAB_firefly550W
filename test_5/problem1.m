clc;clear
x = 0:0.01:5;
y = x.*exp(-x/3);
ans1 = trapz(x,y);
deta = ans1 - (-24*exp(-5/3)+9);
