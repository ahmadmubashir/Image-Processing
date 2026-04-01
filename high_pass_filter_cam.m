clc;
clear all;
% Load the image
img = imread('cameraman.tif');
imshow(img);

% Define the desired cutoff frequency
cutoff_freq = 0.1; % in normalized frequency units

% Convert the cutoff frequency to a cutoff radius in pixels
sampling_freq = 1; % normalized frequency units
cutoff_radius = cutoff_freq / sampling_freq;

% Create the high-pass filter
highpass_filter = fspecial('unsharp', cutoff_radius);

% Apply the high-pass filter to the image
filtered_img = imfilter(img, highpass_filter, 'replicate');

% Display the filtered image
imshow(filtered_img);
