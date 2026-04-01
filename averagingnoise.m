clc;
clear all;
% MATLAB code for denoising by averaging
% Read the cameraman image: original image.
I=imread("cameraman.tif");
 
% Create noise-1 of std=40
n1=40*randn(size(I));
 
% Create first noisy_image by adding the noise to orig image.
I1=double(I)+n1;
 
% Create noise-2 of std=40
n2=40*randn(size(I));
 
% Create 2nd noisy_image by adding the noise to orig image.
I2=double(I)+n2;
 
% Create noise-3 of std=40
n3=40*randn(size(I));
 
% Create 3rd noisy_image by adding the noise to orig image.
I3=double(I)+n3;
 
% Create noise-4 of std=40
n4=40*randn(size(I));
 
% Create 4th noisy_image by adding the noise to orig image.
I4=double(I)+n4;
 
% Create noise-5 of std=40
n5=40*randn(size(I));
 
% Create 5th noisy_image by adding the noise to orig image.
I5=double(I)+n5;
 
% Now lets see denoising.
d1=(I1+I2)/2;
d2=(I1+I2+I3)/3;
d3=(I1+I2+I3+I4)/4;
d4=(I1+I2+I3+I4+I5)/5;
 
%display each denoised image with original noisy image.
imtool(I1,[]);
imtool(d1,[]);
imtool(d2,[]);
imtool(d3,[]);
imtool(d4,[]);







