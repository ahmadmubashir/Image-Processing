clc;
clear all;

I = imread('pout.tif');
figure
imshow(I)

J = imadjust(I,stretchlim(I),[]);
figure
imshow(J)