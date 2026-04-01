clc;
clear all;

% Define the vector
y = [255 255 255 240 230 200 150 100 60 40 20 0 0 0 ];

% Define the sampling interval
dx = 1;

% Calculate the first order derivative
dydx = diff(y)./dx;

% Calculate the second order derivative
d2ydx2 = diff(dydx)./dx;

% Display the results
disp('First order derivative:');
disp(dydx);
disp('Second order derivative:');
disp(d2ydx2);
