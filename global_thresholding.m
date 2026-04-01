clc;
clear all;
% Example usage:
% Load your image
% Replace 'your_image.jpg' with the path to your image
image = imread('a.jpg');

% Set initial threshold and delta T
initialThreshold = 100;
deltaT = 0.01;

% Apply the simple thresholding algorithm
binaryImage = simpleThresholdingAlgorithm(image, initialThreshold, deltaT);