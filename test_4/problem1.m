clear;clc
A = [3 6 4;1 5 0;0 7 7];
B = [1;2;3];
X = A\B;
disp(X)
e = norm(B-A*X);
