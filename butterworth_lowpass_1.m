clc;
clear all;
img = imread('cameraman.tif');
% img = rgb2gray(img);
D = 80;
n = 2;
F = fft2(double(img));
F = fftshift(F);
[M, N] = size(img);
[u, v] = meshgrid(-(N/2):(N/2-1), -(M/2):(M/2-1));
D_uv = sqrt(u.^2 + v.^2);
D = D/2;
H = (1 - (1./(1 + (D./D_uv).^(2*n))));
G = H .* F;
g = real(ifft2(ifftshift(G)));
filtered_img = uint8(g);
subplot(2, 2, 1), imshow(log(1+abs(F)), []), title('Original Image Spectrum');
subplot(2, 2, 2), imshow(log(1+abs(G)), []), title('Filtered Image Spectrum');

subplot(2, 2, 3), imshow(img), title('Original Image');
subplot(2, 2, 4), imshow(filtered_img), title('Filtered Image');

