clc;
clear all;
s = imread('cameraman.tif');
g = im2gray(s);

d = im2double(g);

log1 = 5 * log(1 + d);

imshow(log1);