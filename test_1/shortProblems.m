%编写一个名为 shortProblems.m 的脚本，并将所有命令放入其中。
%Problem1

%1. 标量变量及其运算
a = 10;
b = 2.5.*10^23;
c = 2 + 3i;
d = exp(2.*pi*1i/3);
x = 1/(1+exp(-(a-15)/6));
y = (sqrt(a)+b^(1/21))^pi;
%实部用real(),虚部用imag()
z = log(real((c+d).*(c-d))).*sin(a.*pi/3)/(c.*conj(c));

%2. 向量变量
aVec = [3.14 15 9 26];
bVec = [2.71;8;28;182];
cVec = 5:-0.2:-5;%无需使用[]
dVec = logspace(0,1,100);
eVec = "Hello";

%3. 矩阵变量
aMat = 2*ones(9);
bMat = diag([1 2 3 4 5 4 3 2 1]);
cMat = 1:100;
cMat = reshape(cMat,[10,10]);
dMat = nan(3,4);
eMat = [13 -1 5;-22 10 -87];
fMat = floor(-3+7*rand([5,3]));

%4. 矩阵公式
xMat = (aVec*bVec)*aMat^2;
yMat = (bVec*aVec);
zMat = det(cMat)*(aMat*bMat)';

%5.常用功能和索引
%a
cSum = sum(cMat);%如果 A 是矩阵，则 sum(A) 将返回包含每列总和的行向量
%b
eMean = mean(eMat);%如果 A 为矩阵，那么 mean(A) 返回包含每列均值的行向量
%c
eMat(1,:) = [1,1,1];
%d
cSub = cMat(2:9,2:9);
%e
lin = 1:1:20;
lin(2:2:20) = -lin(2:2:20);
%f
r = rand(1,5);
idx = find(r<0.5);
r(idx) = 0;

%6.矩阵的拼接
%E 是单位矩阵（eye(n)）
%R 是随机矩阵（rand(n)）。
%O 是零矩阵（zeros(n)）。
% S 是对角矩阵（diag()）。
E = eye(3);
R = rand(3,2);
O = zeros(2,3);
%随机一个对角矩阵
s = randi([-10 10],1,2);
S = diag(s);
A = [E R;O S];
%定义一个验证矩阵Acheck
Adoub = A^2;
Acheck = [E R+R*S;O S^2];
% 比较矩阵并检查是否相等
isEqual = isequal(Acheck, Adoub);
if isEqual == 1
   disp("correct");
else
    disp("wrong");
end