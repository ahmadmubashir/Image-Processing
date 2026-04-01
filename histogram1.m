clc;
clear all;
% Step 1: Load the input image as a matrix
img = [0 6 5 4 6 6 0;
       2 5 4 2 2 2 3;
       2 2 2 2 3 5 5;
       0 4 3 5 4 4 0;
       4 5 4 2 2 2 3;
       4 3 4 5 6 6 6;
       0 4 5 5 3 4 0;
       0 4 5 4 5 5 0;
       0 5 4 2 2 2 3;
       3 3 3 3 4 5 5];

% Step 2: Calculate the image histogram
hist = zeros(1, 8);
for i = 0:7
    hist(i+1) = sum(sum(img==i));
end

% Step 3: Calculate the cumulative distribution function (CDF) of the histogram
cdf = cumsum(hist) / numel(img);

% Step 4: Calculate the equalized histogram
eq_hist = round(cdf * 7);

% Step 5: Replace each pixel in the image with its corresponding value in the equalized histogram
img_eq = eq_hist(img + 1);

% Step 6: Display the original and equalized images side by side
% figure;
% subplot(1,2,1), imshow(img,[]);
% title('Original Image');
% subplot(1,2,2), imshow(img_eq,[]);
% title('Equalized Image');

figure;
subplot(1,2,1), histogram(img);
title('Original Image');
subplot(1,2,2), histogram(img_eq);
title('Equalized Image');
