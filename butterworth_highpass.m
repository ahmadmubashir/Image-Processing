clc;
clear all;
% Load the image matrix into MATLAB or create a 4x4 matrix image
%image = [1 0 1 0; 1 0 1 0; 1 0 1 0; 1 0 1 0];
image = imread('cameraman.tif');   

% Compute the 2D discrete Fourier transform (DFT) of the image
frequency_domain = fft2(image);

% Shift the zero-frequency component to the center of the frequency domain
frequency_domain_shifted = fftshift(frequency_domain);

% Calculate the distances of each point in the frequency domain from the center point
[m, n] = size(image);
 [X, Y] = meshgrid(-(n/2):(n/2-1), -(m/2):(m/2-1));

%  X = [0,0,0,0;1,1,1,1;2,2,2,2;-1,-1,-1,-1];
%  Y = [0,1,2,-1;0,1,2,-1;0,1,2,-1;0,1,2,-1];

distances = sqrt(X.^2 + Y.^2);

% Define the cutoff frequency and order of the filter
cutoff_frequency = 80; % Hz
order = 2;

% Calculate the Butterworth low-pass filter using the distances and the cutoff frequency
butterworth = 1 ./ (1 + (distances ./ cutoff_frequency) .^ (2 * order));

% For butterworth high pass filter
  butterworth = 1 - butterworth;

% Apply the filter to the shifted frequency domain by element-wise multiplication
filtered_frequency_domain_shifted = frequency_domain_shifted .* butterworth;

% Shift the zero-frequency component back to the top-left corner of the frequency domain
filtered_frequency_domain = ifftshift(filtered_frequency_domain_shifted);

% Compute the real part of the inverse 2D discrete Fourier transform (DFT) of the filtered frequency domain
filtered_image_frequency = ifft2(filtered_frequency_domain);
filtered_image = real(filtered_image_frequency);
 filtered_image(filtered_image<10) = 0;
% Display the original and filtered images
subplot(1,2,1), imshow(image, []), title('Original Image')
subplot(1,2,2), imshow(filtered_image, []), title('Filtered Image')
