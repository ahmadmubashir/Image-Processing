clc;
clear all;

% Load color image
img = imread('football.jpg');

% Convert to double precision
img = im2double(img);

% Split into color channels
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Apply Laplacian operator on each channel separately
lap_R = 2*R - imfilter(R, fspecial('laplacian', 0));
lap_G = 2*G - imfilter(G, fspecial('laplacian', 0));
lap_B = 2*B - imfilter(B, fspecial('laplacian', 0));

% Combine color channels back into color image
lap_img = cat(3, lap_R, lap_G, lap_B);

% Display the original and Laplacian filtered image
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(lap_img);
title('Laplacian Filtered Image');
