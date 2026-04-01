% Read the reference and moving images
refImage = imread('reference_image.jpg');
movingImage = imread('rotated.jpg');

% Resize the images to ensure all dimensions are greater than 4
refImage = imresize(refImage, [500, 500]); % Adjust the size as needed
movingImage = imresize(movingImage, [500, 500]); % Adjust the size as needed

% Display the reference and moving images
figure;
subplot(1,2,1);
imshow(refImage);
title('Reference Image');
subplot(1,2,2);
imshow(movingImage);
title('Moving Image');

% Perform image registration using affine transformation
[optimizer, metric] = imregconfig('multimodal');
registeredImage = imregister(movingImage, refImage, 'affine', optimizer, metric);

% Display the registered image
figure;
imshowpair(refImage, registeredImage, 'montage');
title('Registered Image');

% Display the difference between the registered image and reference image
diffImage = imabsdiff(refImage, registeredImage);
figure;
imshow(diffImage);
title('Difference Image');
