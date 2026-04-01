clc;
clear all;
% Define the image
image = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];

[A B] = size(image);
DFT_kernel = [1 1 1 1; 1 -j -1 j; 1 -1 1 -1; 1 j -1 -j];

% Fourier transform of the image
F = DFT_kernel * image * DFT_kernel;
F = ifftshift(F);
% Filter parameters
n = 4; % Size of the filter (same as the image for this example)
D0 = 0.5; % Cutoff frequency

% Create meshgrid
[X, Y] = meshgrid(-(n/2):(n/2-1), -(n/2):(n/2-1));

% Compute distances from the center of the grid
D = sqrt(X.^2 + Y.^2);

% Create the ideal low-pass filter
H = double(D <= D0);

% H = 1 - H;

% Apply the filter in the frequency domain
G = F .* H;
G = ifftshift(G);
% Take the inverse Fourier transform to obtain the filtered image

DFTINV_kernel = [1 1 1 1; 1 j -1 -j; 1 -1 1 -1; 1 -j -1 j];
F_INV = ((DFTINV_kernel * G * DFTINV_kernel)/ (A*B));

% % Display the original and filtered images
% figure;
% subplot(1,2,1); imshow(X, []); title('Original Image');
% subplot(1,2,2); imshow(abs(Y), []); title('Filtered Image');
