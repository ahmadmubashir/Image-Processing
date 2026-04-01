clc

clear all

close all

y=imread('peppers.png');

figure;

imshow(y);
x = rgb2gray(y);
figure;

imshow(x);

title('Original Image');
% 
% % x = [50 50 50 50 50 50 50 50;
% %     50 50 50 50 50 50 50 50;
% %     50 50 50 50 50 50 50 50;
% %     50 50 50 50 50 50 50 50;
% %     100 100 100 100 100 100 100 100;
% %     100 100 100 100 100 100 100 100;
% %     100 100 100 100 100 100 100 100;
% %     100 100 100 100 100 100 100 100];
% 
g=[-1 -1 -1; 
    -1 8 -1; 
    -1 -1 -1];

output=imfilter(x,g);
    
figure;imshow(output)

   new = x + output;
  figure;imshow(new)
  
  