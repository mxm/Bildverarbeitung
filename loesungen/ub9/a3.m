I = double(imread("lena-bw.png"));

S = [NaN NaN 0 NaN NaN; NaN 0 2 0 NaN; 0 2 4 2 0; NaN 0 2 0 NaN; NaN NaN 0 NaN NaN];

Id = gs_dilation(I, S);
Ie = gs_erosion(I, S);
Ic = gs_closing(I, S);
Io = gs_opening(I, S);

imwrite(uint8(Id), "lena-bw-dilation.png");
imwrite(uint8(Ie), "lena-bw-erosion.png");
imwrite(uint8(Ic), "lena-bw-closing.png");
imwrite(uint8(Io), "lena-bw-opening.png");
