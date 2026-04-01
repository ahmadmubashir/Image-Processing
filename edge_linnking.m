% Read the image
image = imread('local.jpg');


% Convert the image to grayscale if it is an RGB image
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Convert the image to double precision for computations
grayImage = im2double(grayImage);

% Define the Prewitt operator masks
dx = [-1 0 1; -1 0 1; -1 0 1];
dy = [-1 -1 -1; 0 0 0; 1 1 1];

% Compute the gradients in the x and y directions
gradientX = conv2(grayImage, dx, 'same');
gradientY = conv2(grayImage, dy, 'same');

% Compute the magnitude and direction of the gradients
gradientMagnitude = sqrt(gradientX.^2 + gradientY.^2);
gradientDirection = atan2(gradientY, gradientX);

% Display the gradients, magnitude, and direction
figure;
subplot(2, 2, 1);
imshow(image);
title('Original Image');
subplot(2, 2, 2);
imshow(gradientX);
title('Gradient in X Direction');
subplot(2, 2, 3);
imshow(gradientY);
title('Gradient in Y Direction');
subplot(2, 2, 4);
imshow(gradientMagnitude);
title('Gradient Magnitude');
