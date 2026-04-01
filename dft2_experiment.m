
clc;
clear all;
% Create a 4x4 matrix
A = [1 0 0 1];
A = A';

K = [1 1 1 1; 1 -j -1 j; 1 -1 1 -1; 1 j -1 -j];

C = K * A;

K1 = [1 1 1 1; 1 j -1 -j; 1 -1 1 -1; 1 -j -1 j];

D = K1*C/4;