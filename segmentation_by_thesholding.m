clc;
clear all;
% Read the image
image = imread('mubo1.jpg');

% Convert the image to grayscale if it is an RGB image
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Convert the image to double precision for computations
grayImage = im2double(grayImage);

% Set the threshold value
threshold = 0.7; % Adjust this value as needed

% Threshold the image
binaryImage = grayImage >= threshold;

% Display the original image and the segmented image
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');
subplot(1, 2, 2);
imshow(binaryImage);
title('Segmented Image');
