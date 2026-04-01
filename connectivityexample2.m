clc;
clear all;
matrix1 = [147  155  139  104   84  139; 136  134   99   73   60  144; 98   82   60   54   47  118; 86   59   46   48   38   90; 88   66   50   44   35   67; 88   75   53   40   43   48];
V = {1:50};
binary_matrix = [147  155  139  104   84  139; 136  134   99   73   60  144; 98   82   60   54   47  118; 86   59   46   48   38   90; 88   66   50   44   35   67; 88   75   53   40   43   48];
binary_matrix(binary_matrix > 60) = 0;
binary_matrix(binary_matrix <= 50 & binary_matrix >= 1) = 1;

L = bwlabel(binary_matrix,4);
[r, c] = find(L==1);
rc = [r c];
imshow(L);
