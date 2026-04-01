% Read the two images
image1 = imread('1.jpg'); % Replace with the path to your first image
image2 = imread('2.jpg'); % Replace with the path to your second image

% Convert the images to grayscale
gray1 = rgb2gray(image1);
gray2 = rgb2gray(image2);

% Perform background subtraction
diff = imabsdiff(gray1, gray2);

% Apply thresholding to obtain binary mask
threshold = 30; % Adjust the threshold value as needed
binary_mask = diff > threshold;


% Display the binary mask
figure;
imshow(binary_mask);
title('Segmented Image');

% Display the original images for comparison
figure;
subplot(1, 2, 1);
imshow(image1);
title('Image 1');
subplot(1, 2, 2);
imshow(image2);
title('Image 2');
