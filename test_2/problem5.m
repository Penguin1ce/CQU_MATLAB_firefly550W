A = imread('camera.gif');
A_reshape = reshape(A,[],1);
figure

histogram(A_reshape,0:255);
title('Histogram of camera.gif')