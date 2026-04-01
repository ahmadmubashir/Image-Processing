clc;
clear all;

% Read the image
I = imread('cameraman.tif');
% I = im2double(I);
% Set the gamma value
gamma = 0;

% Perform the gamma transformation
J = imadjust(I,[],[],gamma);

% Display the original and transformed images
figure;
subplot(1,2,1); imshow(I); title('Original Image');
subplot(1,2,2); imshow(J); title('Gamma Transformed Image');
% 
% % Perform the inverse gamma transformation (gamma correction)
% K = imadjust(J,[],[],1/gamma);
% 
% % Display the corrected image
% figure;
% imshow(K);
% title('Gamma Corrected Image');