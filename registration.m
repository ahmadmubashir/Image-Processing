clc;
clear all;

% Read an image
originalImage = imread('aa.jpg'); % Replace 'path_to_your_image.jpg' with the path to your image

% Display the original image
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

% Rotation
angle = 50; % Define the rotation angle in degrees
rotatedImage = imrotate(originalImage, angle, 'bilinear', 'crop');

% Display the rotated image
subplot(2, 2, 2);
imshow(rotatedImage);
title('Rotated Image');

% Translation (Shifting)
tx = 200; % Translation along x-axis
ty = 300; % Translation along y-axis
translatedImage = imtranslate(originalImage, [tx, ty]);

% Display the translated image
subplot(2, 2, 3);
imshow(translatedImage);
title('Translated Image');

% Scaling
scaleFactor = 4.5; % Scale factor
scaledImage = imresize(originalImage, scaleFactor);

% Display the scaled image
subplot(2, 2, 4);
imshow(scaledImage);
title('Scaled Image');
