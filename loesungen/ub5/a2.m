% load images
LENA = imread("lena-bw.png");
LADY = imread("old-lady-bw.png");

%%%%% part a %%%%%

% enlarge * 4 with bilinear interpolation
% not really part of the homework, but interesting anyway
LENA_enlarged4 = bilinear2(LENA);
imwrite(uint8(LENA_enlarged4), "lena-enlarged4.png");

LADY_enlarged4 = bilinear2(LADY);
imwrite(uint8(LADY_enlarged4), "old-lady-enlarged4.png");

% enlarge * 16 with bilinear interpolation
LENA_enlarged16 = bilinear4(LENA);
imwrite(uint8(LENA_enlarged16), "lena-enlarged16.png");

LADY_enlarged16 = bilinear4(LADY);
imwrite(uint8(LADY_enlarged16), "old-lady-enlarged16.png");

%%%%% part b %%%%%

% shrink to a sixteenth
LENA_shrinked = shrink4x4(LENA);
imwrite(uint8(LENA_shrinked), "lena-shrinked.png");

LADY_shrinked = shrink4x4(LADY);
imwrite(uint8(LADY_shrinked), "old-lady-shrinked.png");

% enlarge to original size again
LENA_reresized = bilinear4(LENA_shrinked);
imwrite(uint8(LENA_reresized), "lena-reresized.png");

LADY_reresized = bilinear4(LADY_shrinked);
imwrite(uint8(LADY_reresized), "old-lady-reresized.png");
