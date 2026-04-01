clc;
clear all;
% Define the original image
X = imread('cameraman.tif');

% Take the Fourier transform of the image
F = fft2(X);

% Shift the zero-frequency component to the center of the spectrum
F1 = fftshift(F);

% Define the ideal low pass filter
d0 = 240;
[M, N] = size(F1);
u = 0:(M-1);
v = 0:(N-1);
idx = find(u>M/2);
u(idx) = u(idx) - M;
idy = find(v>N/2);
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);
D = sqrt((U-M/2).^2 + (V-N/2).^2);
H = (D <= d0);
%Ideal low pass
 H = double(H);

%Ideal High pass
    H = 1-H;

% Apply the filter in the frequency domain
G1 = F .* H;

% Shift the zero-frequency component back to the top-left corner
G = ifftshift(G1);

% Take the inverse Fourier transform to obtain the filtered image
Y = ifft2(G);

% Display the original and filtered images
figure;
subplot(1,2,1); imshow(X, []); title('Original Image');
subplot(1,2,2); imshow(abs(Y), []); title('Filtered Image');