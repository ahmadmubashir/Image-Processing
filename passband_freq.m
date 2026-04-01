% Read in the input image
input_img = imread('Lenna.png');

% Convert the image to grayscale
gray_img = rgb2gray(input_img);

% Apply a Gaussian highpass filter to the image
sigma = 1; % standard deviation of the Gaussian filter
filtered_img = imgaussfilt(gray_img, sigma);

% Define the passband frequencies
low_freq = 0.05; % lower frequency cutoff (normalized frequency)
high_freq = 0.4; % upper frequency cutoff (normalized frequency)

% Calculate the Fourier transform of the filtered image
f = fft2(filtered_img);

% Create a bandpass filter using a combination of highpass and lowpass filters
[x, y] = meshgrid(1:size(f,2), 1:size(f,1));
center_x = floor(size(f,2)/2) + 1; % x-coordinate of the center of the filter
center_y = floor(size(f,1)/2) + 1; % y-coordinate of the center of the filter
lowpass_filter = exp(-((x-center_x).^2 + (y-center_y).^2)/(2*(low_freq*size(f,2))^2));
highpass_filter = 1 - exp(-((x-center_x).^2 + (y-center_y).^2)/(2*(high_freq*size(f,2))^2));
bandpass_filter = highpass_filter .* lowpass_filter;

% Apply the bandpass filter to the Fourier transform
filtered_f = f .* bandpass_filter;

% Inverse Fourier transform to obtain the filtered image
filtered_img = real(ifft2(filtered_f));

% Find edges in the filtered image using the Canny edge detection algorithm
edges = edge(filtered_img, 'Canny');

% Display the original image and the edges
figure;
subplot(1,2,1);
imshow(input_img);
title('Original Image');
subplot(1,2,2);
imshow(edges);
title('Edges Detected using Bandpass Filter');
