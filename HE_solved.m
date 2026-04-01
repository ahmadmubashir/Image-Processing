clc;
clear all;

R = 150;
G = 130;
B = 120;

R = R/255;
G = G/255;
B = B/255;

s = 3/(R+G+B) * min([R G B]);
S = 1- s;
I = (1/3) * (R+G+B);
I = I * 255;

a = 1/2 * ((R-G) + (R - B));
b = sqrt((R-G)^2);
d = (R-B);
e = (G-B);
f = b+d+e;
c = a/f;

theta = acosd(c);

if(B>G)
    H = 360 - theta;
else
    H = theta;
end

