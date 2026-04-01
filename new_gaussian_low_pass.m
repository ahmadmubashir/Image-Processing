clc;
clear all;
% Define the image
image = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];

% Fourier transform of the image
F = fft2(image);
n = 4;
[M N] = size(F);

% Filter parameters
sigma = 1; % Cutoff frequency

[X, Y] = meshgrid(-(n/2):(n/2-1), -(n/2):(n/2-1));
 
% Compute distances from the center of the grid
center_x = ceil(M/2);
center_y = ceil(N/2);

% Create the Gaussian low-pass filter
H = exp(-((X- center_x).^2 + (Y- center_y).^2)/(2*sigma.^2));

G1 = F .* H;

G = ifftshift(G1);

% Apply the filter to the Fourier transformed image
filtered_image = ifft2(G);

% Display the original and filtered images
disp('Original Image:');
disp(image);
disp('Filtered Image:');
disp(filtered_image);
