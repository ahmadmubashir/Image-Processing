clc;
clear all;

% MATLAB code for Forward 
% operator edge detection
k=imread("peppers.png");
k=rgb2gray(k);
k1=double(k);
forward_msk=[0 1 -1];
kx=conv2(k1, forward_msk, 'same');
ky=conv2(k1, forward_msk', 'same');
ked=sqrt(kx.^2 + ky.^2);
  
%display the images.
imtool(k,[]);
 
%display the edge detection along x-axis.

imtool(abs(kx), []);
  
%display the edge detection along y-axis.

imtool(abs(ky),[]);
  
%display the full edge detection.

imtool(abs(ked),[]);