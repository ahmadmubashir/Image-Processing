clc;
clear all;
% Load the input image
img = imread('Lenna.png');
img = rgb2gray(img);
figure, imshow(img);

% Add periodic noise to the image
[x,y] = meshgrid(1:size(img,2),1:size(img,1));
periodic_noise = 2*sin(2*pi*20*x/size(img,2) + 2*pi*20*y/size(img,1));
noisy_img = double(img) + periodic_noise;
noisy_img = uint8(noisy_img);
figure, imshow(noisy_img);

% Fourier transform of the noisy image
f = fft2(double(noisy_img));

% Define the center frequency of the notch filter
center_freq_x = size(img,2)/2 + 1; % x-coordinate of the center frequency
center_freq_y = size(img,1)/2 + 1; % y-coordinate of the center frequency

% Define the width of the notch filter
width = 10;

% Generate the notch filter
notch_filter = 1 - exp(-((x-center_freq_x).^2 + (y-center_freq_y).^2)/(2*width^2));

% Apply the notch filter to the Fourier transform of the noisy image
filtered_f = f .* notch_filter;

% Inverse Fourier transform to obtain the filtered image
filtered_img = real(ifft2(filtered_f));

% Display the filtered image
figure, imshow(filtered_img, []);

% Save the filtered image
imwrite(filtered_img, 'filtered_image.jpg');

