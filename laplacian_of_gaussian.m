clc;
clear all;

I = imread('moon.tif');
imtool(I, [])

h = fspecial('log',5,0.4);

I2 = imfilter(I,h);

imtool(I2, [])

I3 = I - I2;
imtool(I3, []);

I4 = I + I2;

imtool(I4, []);