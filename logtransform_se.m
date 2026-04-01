clc;
clear all;

% Read in the original image
img = imread('cameraman.tif');

% Apply a logarithmic transform to the image
c = 61; % Constant used to adjust the brightness of the image
img_log = c * log(1 + double(img));

% Display the original and transformed images side-by-side
figure;
subplot(1, 2, 1); imshow(img); title('Original image');
subplot(1, 2, 2); imshow(uint8(img_log)); title('Logarithmic transformed image');