clc;
clear all;

I = imread('cameraman.tif');
J = imnoise(I,'salt & pepper',0.1);
subplot(1, 2, 1);
imshow(J);
title('Original Image');
 
imshow(J)
K = medfilt2(J,[35 35]); 
subplot(1, 2, 2);
imshow(K);
title('Filtered Image');
  
%     x = I - K;