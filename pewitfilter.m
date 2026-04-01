clc;
clear all;
img = imread('peppers.png');
figure;
imshow(img);
img = rgb2gray(img);
h = [1 0 -1; 
     1 0 -1; 
     1 0 -1]; % Prewitt filter for horizontal direction
filteredImgH = imfilter(img,h,'conv');
v = [-1 -1 -1; 
      0  0  0; 
      1  1  1]; % Prewitt filter for vertical direction
filteredImgV = imfilter(img,v,'conv');
outputImg = filteredImgH + filteredImgV;
figure;
imshow(outputImg);