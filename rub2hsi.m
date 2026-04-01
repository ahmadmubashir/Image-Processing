clc;
clear all;
R = 28;
G = 98;
B = 118;

R = R/255;
G = G/255;
B = B/255;

s = ((3/(R+G+B)) * min([R G B]));
S = 1- s;

I = ((1/3) * (R+G+B));

a = 1/2 * ((R-G) + (R - B));
b = ((R-G).^2);
d = (R-B);
e = (G-B);

f = sqrt(b+(d*e));
c = a/f;
 
theta = acosd(c);
 
if(B>G)
    H = 360 - theta;
else
    H = theta;
end


I = I
S = S
theta = H 

