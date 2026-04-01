% Read the image
img = imread('hough.jpg');

% Convert the image to grayscale
grayImg = rgb2gray(img);

% Apply edge detection using the Canny method
edgeImg = edge(grayImg, 'Canny');

figure; imshow(edgeImg);

% Define the Hough Transform parameters
thetaResolution = 0.9;  % Resolution of theta values in degrees
rhoResolution = 1;      % Resolution of rho values in pixels

% Compute the Hough Transform matrix
[H, theta, rho] = hough(edgeImg, 'RhoResolution', rhoResolution, 'Theta', -90:thetaResolution:89);

% Find the peaks in the Hough Transform matrix
numPeaks = 1;  % Number of peaks to find
peaks = houghpeaks(H, numPeaks);

% Extract the lines from the peaks
lines = houghlines(edgeImg, theta, rho, peaks);

% Display the original image with detected lines
figure;
imshow(img);
hold on;

for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 2, 'Color', 'r');
end

hold off;
