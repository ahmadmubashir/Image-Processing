% Read the image
image = imread('mubo1.jpg');

% Convert the image to grayscale if it is an RGB image
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Convert the image to double precision for computations
grayImage = im2double(grayImage);

% Apply the Laplacian operator
laplacian = fspecial('laplacian');
laplacianImage = imfilter(grayImage, laplacian);

% Find zero crossings
zeroCrossings = edge(laplacianImage, 'zerocross');

% Display the results
figure;
subplot(1, 3, 1);
imshow(image);
title('Original Image');
subplot(1, 3, 2);
imshow(laplacianImage);
title('Laplacian Operator');
subplot(1, 3, 3);
imshow(zeroCrossings);
title('Zero Crossings');
