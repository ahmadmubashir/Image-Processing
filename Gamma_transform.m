clc;
clear all;

original_image = imread('Pegion.png'); % Replace 'your_image.jpg' with your image file
% original_image = [120 10, 25; 20 40 80; 120 70 60]; 
% Display the original image
subplot(1, 2, 1);
imshow(original_image);
title('Original Image');

C = 1;
% Gamma correction parameters
gamma = 3; % Adjust the value to modify the gamma transformation

% Gamma transformation
gamma_transformed = C * (original_image .^1/gamma) ;

% Display the gamma-transformed image
subplot(1, 2, 2);
imshow(gamma_transformed);
title('Gamma Transformed Image');
