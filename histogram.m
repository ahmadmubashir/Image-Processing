I = imread("pout.tif");

figure
subplot(1,3,1)
imshow(I)
subplot(1,3,2:3)
imhist(I)

J = histeq(I);

figure
subplot(1,3,1)
imshow(J)
subplot(1,3,2:3)
imhist(J)

nbins = 30;
K = histeq(I,nbins);
figure
subplot(1,3,1)
imshow(K)
subplot(1,3,2:3)
imhist(K)
