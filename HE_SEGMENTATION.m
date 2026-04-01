clc;
clear all;
% Load color image
i = [100; 200; 50; 80; 150];
j = [120; 180; 50; 90; 130];
k = [150; 100; 50; 70; 120];

img = cat(3, i, j, k);

% Convert to HSV color space
hsv_img = rgb2hsv(img);

% Apply histogram equalization to the Value channel
hsv_img(:,:,3) = histeq(hsv_img(:,:,3));

% Convert back to RGB color space
eq_img = hsv2rgb(hsv_img);

% Convert the image to uint8 data type
eq_img = im2uint8(eq_img);

% Display original and equalized images side by side
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(eq_img);
title('Equalized Image');

% % Perform segmentation using K-means clustering
% num_clusters = 2;
% pixel_labels = imsegkmeans(eq_img,num_clusters);
% 
% % Display segmented image
% figure;
% imshow(pixel_labels,[]);
% title('Segmented Image');
