% load lena image
%LENA = imread("lena-bw.png");
LENA = imread("lena64.png");

B = padZero(LENA);

mwOrt = 1/9 * [1 1 1; 1 1 1; 1 1 1];

B1 = uint8(falte(B, mwOrt));


