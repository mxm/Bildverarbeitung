LENA = imread("lena64.png");
%LENA = imread("lena-bw.png");

imshow(denormalize(normalize(LENA)), [0,255])
H = haar(normalize(LENA));
imshow(denormalize(B), [0,255])
