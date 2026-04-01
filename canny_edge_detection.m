clc;
clear all;
% Step 1: Convert the image to grayscale
img = imread('mubo1.jpg');
grayImg = rgb2gray(img);

% Step 2: Apply Gaussian smoothing
filteredImg = imgaussfilt(grayImg, 2); % Adjust the standard deviation as needed

% Step 3: Compute the gradient magnitude and orientation
[Gx, Gy] = gradient(double(filteredImg));
gradientMagnitude = sqrt(Gx.^2 + Gy.^2);
gradientOrientation = atan2(Gy, Gx) * 180 / pi; % Convert to degrees

% Step 4: Apply non-maximum suppression
suppressedImg = nonmaxsupp(gradientMagnitude, gradientOrientation);

% Step 5: Apply hysteresis thresholding
highThreshold = 0.2 * max(suppressedImg(:)); % Adjust the high threshold ratio as needed
lowThreshold = 0.1 * highThreshold; % Adjust the low threshold ratio as needed

edgeImg = hysthresh(suppressedImg, highThreshold, lowThreshold);

% Step 6: Edge tracking by hysteresis
edgeImg = edgeLinking(edgeImg);

% Step 7: Output the final edge image
imshow(edgeImg);

% Function for non-maximum suppression
function output = nonmaxsupp(gradientMagnitude, gradientOrientation)
    [rows, cols] = size(gradientMagnitude);
    output = zeros(rows, cols);
    
    for i = 2:rows-1
        for j = 2:cols-1
            angle = gradientOrientation(i, j);
            mag = gradientMagnitude(i, j);
            
            % Interpolate the pixels in the gradient direction
            if (-22.5 <= angle && angle < 22.5) || (157.5 <= angle && angle <= 180) || (-180 <= angle && angle < -157.5)
                beforeMag = gradientMagnitude(i, j-1);
                afterMag = gradientMagnitude(i, j+1);
            elseif (22.5 <= angle && angle < 67.5) || (-157.5 <= angle && angle < -112.5)
                beforeMag = gradientMagnitude(i-1, j-1);
                afterMag = gradientMagnitude(i+1, j+1);
            elseif (67.5 <= angle && angle < 112.5) || (-112.5 <= angle && angle < -67.5)
                beforeMag = gradientMagnitude(i-1, j);
                afterMag = gradientMagnitude(i+1, j);
            else
                beforeMag = gradientMagnitude(i+1, j-1);
                afterMag = gradientMagnitude(i-1, j+1);
            end
            
            % Perform non-maximum suppression
            if mag >= beforeMag && mag >= afterMag
                output(i, j) = mag;
            end
        end
    end
end

% Function for hysteresis thresholding
function output = hysthresh(input, highThreshold, lowThreshold)
    output = zeros(size(input));
    
    strongEdges = input > highThreshold;
    weakEdges = (input >= lowThreshold) & (input <= highThreshold);
    
    % Assign strong edges
    output(strongEdges) = 1;
    
    % Connect weak edges to strong edges
    [rows, cols] = size(input);
    for i = 2:rows-1
        for j = 2:cols-1
            if weakEdges(i, j) && any(strongEdges(i-1:i+1))
                            if weakEdges(i, j) && any(strongEdges(i-1:i+1, j-1:j+1))
                output(i, j) = 1;
                            end
            end
        end
    end
end

% Function for edge tracking by hysteresis
function output = edgeLinking(input)
    % Perform edge tracking by hysteresis using connectivity analysis
    [rows, cols] = size(input);
    output = zeros(rows, cols);
    
    % Define 8-connectivity neighbors
    neighbors = [0 1; 1 0; 1 1; -1 1];
    
    % Traverse each pixel
    for i = 2:rows-1
        for j = 2:cols-1
            % Check if the pixel is a weak edge
            if input(i, j) == 1
                % Check the neighbors for strong edges
                for k = 1:size(neighbors, 1)
                    neighborRow = i + neighbors(k, 1);
                    neighborCol = j + neighbors(k, 2);
                    
                    % Check if the neighbor is a strong edge
                    if input(neighborRow, neighborCol) == 1
                        % Mark the pixel as a strong edge
                        output(i, j) = 1;
                        break; % Exit the loop
                    end
                end
            end
        end
    end
end

