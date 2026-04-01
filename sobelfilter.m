
clc;
clear all;
img = imread('peppers.png');
img = rgb2gray(img);
figure;
imshow(img);
h = [-1 0 1; 
    -2 0 2; 
    -1 0 1]; % Sobel filter for horizontal direction
filteredImgH = imfilter(img,h,'conv','replicate');


v = [-1 -2 -1; 
    0 0 0; 
    1 2 1]; % Sobel filter for vertical direction
filteredImgV = imfilter(img,v,'conv','replicate');

outputImg = img + filteredImgH + filteredImgV;
 figure;
  imshow(outputImg);
 