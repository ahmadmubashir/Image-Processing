clc;
clear all;
% Define the original image
%   X = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];
% X = [4 6 4 3; 2 5 6 4; 2 5 7 6; 2 5 5 7];
  X = imread('cameraman.tif');

% Take the Fourier transform of the image
F = fft2(X);

% Shift the zero-frequency component to the center of the spectrum
F1 = fftshift(F);

% Define the ideal low pass filter
% d0 = 100;
d0 = 100;
[M, N] = size(F1);
[U, V] = meshgrid(-(N/2):(N/2-1), -(M/2):(M/2-1));
D = sqrt((U).^2 + (V).^2);
H = double(D >= d0);

% Apply the filter in the frequency domain
G1 = F1 .* H;

% Shift the zero-frequency component back to the top-left corner
G = ifftshift(G1);

% Take the inverse Fourier transform to obtain the filtered image
Y = ifft2(G);

% Display the original and filtered images
figure;
subplot(1,2,1); imshow(X, []); title('Original Image');
subplot(1,2,2); imshow(abs(Y), []); title('Filtered Image');
