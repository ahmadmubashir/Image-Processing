% I = imread('coins.png');
% imshow(I)
% 
% I(I <=150) = 0;
% 
% imshow(I)

I = imread('img.jpg');
imshow(I);

J = rgb2gray(I);

surf(J)
