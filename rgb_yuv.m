clc;
clear all;

% Load RGB image
rgb_img = imread('football.jpg');

% Convert to double precision
rgb_img = im2double(rgb_img);

% Calculate YUV channels using the provided formula
Y = 0.299 * rgb_img(:,:,1) + 0.587 * rgb_img(:,:,2) + 0.114 * rgb_img(:,:,3);
U = -0.147 * rgb_img(:,:,1) - 0.289 * rgb_img(:,:,2) + 0.436 * rgb_img(:,:,3);
V = 0.615 * rgb_img(:,:,1) - 0.515 * rgb_img(:,:,2) - 0.100 * rgb_img(:,:,3);

% Combine YUV channels into a single image
yuv_img = cat(3, Y, U, V);

% Display RGB and YUV images side by side
figure;
subplot(1,2,1);
imshow(rgb_img);
title('RGB Image');
subplot(1,2,2);
imshow(yuv_img);
title('YUV Image');
