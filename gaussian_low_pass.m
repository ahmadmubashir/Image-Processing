clc;
clear all;

% Read the cameraman image (if not already in your workspace)
image = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];

image = fftshift(image);
% Get image dimensions
[m, n] = size(image);

% Filter parameters
sigma = 1; % Standard deviation for Gaussian filter

% Create Gaussian filter
[x, y] = meshgrid(-n/2:n/2-1, -m/2:m/2-1);

distances = sqrt(x.^2 + y.^2);

gaussian_filter = exp(-((distances).^2) / (2*sigma^2));


% Compute Fourier transform of the image
F = fftshift(fft2(image));

% Apply the filter in the frequency domain
filtered_image_F = F .* gaussian_filter;

% Inverse Fourier transform to get the filtered image
filtered_image = ifft2(filtered_image_F);

filtered_image1 = ifftshift(filtered_image);
% Display the original and filtered images
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 2);
imshow(abs(filtered_image), []);
title('Filtered Image (Gaussian Low-Pass)');
