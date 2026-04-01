clc;
clear all;
% Create a 5x5 matrix
M = [1 2 3 4; 6 7 8 9; 11 12 13 14; 16 17 18 19];

% Display the original matrix
disp('Original matrix:');
disp(M);

% Take the Fourier transform of the matrix
f = fft2(M);

% Define the center frequency of the notch filter
center_freq_x = 3; % x-coordinate of the center frequency
center_freq_y = 3; % y-coordinate of the center frequency

% Define the width of the notch filter
width = 1;

% Generate the notch filter
[x,y] = meshgrid(1:size(M,2),1:size(M,1));
notch_filter = 1 - exp(-((x-center_freq_x).^2 + (y-center_freq_y).^2)/(2*width^2));

% Apply the notch filter to the Fourier transform
filtered_f = f .* notch_filter;

% Inverse Fourier transform to obtain the filtered matrix
filtered_M = real(ifft2(filtered_f));

% Display the filtered matrix
disp('Filtered matrix:');
disp(filtered_M);
