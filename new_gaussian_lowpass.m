clc;
clear all;
% Define the image (assuming the same image is used for all filters)
image = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];

% Fourier transform of the image
F = fft2(image);

% Filter parameters
n = 4; % Size of the filter (same as the image for this example)
D0 = 1; % Cutoff frequency

% Create meshgrid
[X, Y] = meshgrid(-(n/2):(n/2-1), -(n/2):(n/2-1));

% Compute distances from the center of the grid
[X_center, Y_center] = meshgrid(-(n-1)/2:(n-1)/2, -(n-1)/2:(n-1)/2);
D = sqrt(X_center.^2 + Y_center.^2);

% Create the Gaussian low-pass filter
H = exp(-(D.^2) / (2 * D0^2));

% Apply the filter to the Fourier transformed image
filtered_image_gaussian = real(ifft2(F .* H));

% Display the filtered image
disp('Gaussian Low-Pass Filtered Image:');
disp(filtered_image_gaussian);
