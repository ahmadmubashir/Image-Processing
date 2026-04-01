clc;
clear all;
%COLOR HISTOGRAM EQUALIZATION

%READ THE INPUT IMAGE
% I = imread('football.jpg');
 A = [1,2,10, 15;3,4, 10, 20];
B = [5,6,30, 23;7,8,20,22];
C = [9,10, 15, 22;11,12,9, 15];
I = cat(3,A,B,C);

%CONVERT THE RGB IMAGE INTO HSV IMAGE FORMAT
HSV = rgb2hsv(I);

Heq = histeq(HSV(:,:,3));
HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;

RGB = hsv2rgb(HSV_mod);
 figure,subplot(1,2,1),imshow(I);title('Before Histogram Equalization');
 subplot(1,2,2),imshow(RGB);title('After Histogram Equalization');