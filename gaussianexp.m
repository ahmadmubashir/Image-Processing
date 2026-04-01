clc;
clear all;
a = [  2   4   3   5   1;   3   1   7   8   6;   9  10  11   5   3;   7   5   2   4   6;   3   2   1   9  10 ];

gauss = imgaussfilt(a,1.5);
