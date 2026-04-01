clc;
clear all;
% Load the image
img = imread('homo1.jpg');
img = rgb2gray(img);
% img = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];
 img = im2double(img);

% Define the parameters for the filter
gamma_l = 0.3;
gamma_h = 0.7;
D0 = 200;
c = 1;


% Convert the image to the frequency domain
f1 = log(1+img);
f2 = fft2(f1);
% f = fft2(img);
f3 = fftshift(f2);

% Create a high-pass filter
[M, N] = size(img);
[u, v] = meshgrid(-(N/2):(N/2-1), -(M/2):(M/2-1));
D_uv = sqrt(u.^2 + v.^2);

% Apply the filter with -c incorporated to the Fourier transformed image
H = (gamma_h - gamma_l) .* (1 - exp(-c .* (D_uv.^2 / (D0^2)))) + gamma_l;
g = f3 .* H;

% Apply the filter
g = real(ifft2(ifftshift(g)));
g1 = exp(g) - 1;
g2 = g1 ./ max(g1(:));

% Display the results
subplot(1,2,1), imshow(img), title('Original Image');
subplot(1,2,2), imshow(g2), title('Filtered Image');
