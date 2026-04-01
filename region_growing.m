% Read the image
image = imread('region.jpg');

% Convert the image to grayscale if it is an RGB image
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Convert the image to double precision for computations
grayImage = im2double(grayImage);

% Set the seed point coordinates (row, column)
seedRow = 10; % Adjust this value as needed
seedCol = 10; % Adjust this value as needed

% Set the threshold for region growing
threshold = 0.1; % Adjust this value as needed

% Initialize the segmented image as zeros
segmented = zeros(size(grayImage));

% Create a stack to store the pixel indices to be processed
stack = zeros(0, 2);
stackSize = 0;

% Get the intensity value of the seed point
seedIntensity = grayImage(seedRow, seedCol);

% Push the seed point to the stack
stackSize = stackSize + 1;
stack(stackSize, :) = [seedRow, seedCol];

% Process the stack until it is empty
while stackSize > 0
    % Pop the top pixel from the stack
    currentPixel = stack(stackSize, :);
    stackSize = stackSize - 1;
    
    % Get the row and column indices of the current pixel
    currentRow = currentPixel(1);
    currentCol = currentPixel(2);
    
    % Check if the current pixel is already segmented or not
    if segmented(currentRow, currentCol) == 0
        % Get the intensity value of the current pixel
        currentIntensity = grayImage(currentRow, currentCol);
        
        % Check if the intensity difference is within the threshold
        if abs(currentIntensity - seedIntensity) <= threshold
            % Mark the current pixel as part of the segmented region
            segmented(currentRow, currentCol) = 1;
            
            % Push the neighboring pixels to the stack
            
            % Top neighbor
            if currentRow > 1
                stackSize = stackSize + 1;
                stack(stackSize, :) = [currentRow - 1, currentCol];
            end
            
            % Bottom neighbor
            if currentRow < size(grayImage, 1)
                stackSize = stackSize + 1;
                stack(stackSize, :) = [currentRow + 1, currentCol];
            end
            
            % Left neighbor
            if currentCol > 1
                stackSize = stackSize + 1;
                stack(stackSize, :) = [currentRow, currentCol - 1];
            end
            
            % Right neighbor
            if currentCol < size(grayImage, 2)
                stackSize = stackSize + 1;
                stack(stackSize, :) = [currentRow, currentCol + 1];
            end
        end
    end
end

% Display the original image and the segmented image
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');
subplot(1, 2, 2);
imshow(segmented);
title('Segmented Image');
