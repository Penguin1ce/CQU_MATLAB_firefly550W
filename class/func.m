clear;clc
x(1)=1;y(1)=1;z(1)=1;%(初始点)
x1(1) = 1;
for k=1:20
    x(k+1)=x(k)^3-x(k)^2-1;
    y(k+1)=(y(k)^2+y(k)+1)^(1/3);
    z(k+1)=1+1/z(k)+1/z(k)^2;
    x1(k+1) = (-2*x(k)^3+x(k)^2-1)/(-3*x(k)^2+2*x(k)+1);
end
n= 1:1:21;
subplot(1,4,1)
plot(n,x);
subplot(1,4,2)
plot(n,y);
subplot(1,4,3)
plot(n,z);
subplot(1,4,4)
plot(n,x1);
