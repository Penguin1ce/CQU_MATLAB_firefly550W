clear;clc
syms k c x x0 t
d=1/sqrt(4*pi*k*t)*exp(-(x-x0-c*t)^2/(4*k*t));
v1 = diff(d,t,1);
v2 = diff(d,x,1);
v3 = diff(d,x,2);
v = v1+c*v2-k*v3;
value = simplify(v);