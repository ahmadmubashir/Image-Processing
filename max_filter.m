clc;
clear all;

% Read the image
I = imread('cameraman.tif');

% Define the size of the filter window
filter_size = [3 3];

% Apply the maximum filter using ordfilt2
max_img = ordfilt2(I, prod(filter_size), ones(filter_size));

% Display the original and filtered images side-by-side
imshowpair(I, max_img, 'montage');