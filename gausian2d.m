s = imread('cameraman.tif');
g = im2gray(s);

% d = im2double(g);

gauss = imgaussfilt(g,10);

imshow(gauss);