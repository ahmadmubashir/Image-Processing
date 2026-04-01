clc;
clear all;

% Read the image
img = imread('peppers.png');
img = im2gray(img);

% Convert the image to grayscale if it's not already in grayscale
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

% Define the Sobel filter
sobel_filter_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_filter_y = sobel_filter_x';

% Apply the Sobel filter using imfilter
filtered_img_x = imfilter(double(img_gray), sobel_filter_x);
filtered_img_y = imfilter(double(img_gray), sobel_filter_y);

% Combine the filtered images to get the gradient magnitude
gradient_magnitude = sqrt(filtered_img_x.^2 + filtered_img_y.^2);

% Display the original image and the filtered image
figure;
subplot(2, 2, 1);
imshow(img_gray);
title('Original Image');

subplot(2, 2, 2);
imshow(filtered_img_x, []);
title('Sobel Filtered (X-direction)');

subplot(2, 2, 3);
imshow(filtered_img_y, []);
title('Sobel Filtered (Y-direction)');

subplot(2, 2, 4);
imshow(gradient_magnitude, []);
title('Gradient Magnitude');
