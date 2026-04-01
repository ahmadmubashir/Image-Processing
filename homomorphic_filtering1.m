clc;
clear all;

% Read the image
original_img = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];
% original_img = im2double(original_img); % Convert to double precision

% Convert the image to logarithmic domain
log_img = log(1 + original_img);
DFT_kernel = [1 1 1 1; 1 -j -1 j; 1 -1 1 -1; 1 j -1 -j];
% Apply Fourier Transform to the logarithmic image
fft_img = DFT_kernel * log_img * DFT_kernel;
fft_img = ifftshift(fft_img);
% Define filter parameters (you can adjust these)
D0 = 50; % Cutoff frequency
gamma_h = 1.3; % Parameter controlling emphasis on high frequencies
gamma_l = 0.5; % Parameter controlling emphasis on low frequencies

% Create meshgrid for frequency domain
[M, N] = size(fft_img);
[U, V] = meshgrid(-(N/2):(N/2-1), -(M/2):(M/2-1));

% Calculate distance matrix in the frequency domain
D_uv = sqrt(U.^2 + V.^2);

% Calculate -c for each frequency component
c = 1;

% Apply the filter with -c incorporated to the Fourier transformed image
H = (gamma_h - gamma_l) .* (1 - exp(-c .* (D_uv.^2 / (D0^2)))) + gamma_l;
fft_img_filtered = fft_img .* H;
DFTINV_kernel = [1 1 1 1; 1 j -1 -j; 1 -1 1 -1; 1 -j -1 j]; 
% Perform inverse Fourier Transform
filtered_img = DFTINV_kernel * fft_img_filtered * DFTINV_kernel;
filtered_img = ifftshift(filtered_img);
% Exponential to revert from the logarithmic domain
result_img1 = exp(filtered_img) - 1;
result_img2 = result_img1 ./ max(result_img1(:));
