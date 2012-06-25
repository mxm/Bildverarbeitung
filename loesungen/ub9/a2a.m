I = imread("rhino-part-bin.png");

S = [0 1 0; 1 1 1; 0 1 0];

Id = dilation(I, S);
Ie = erosion(I, S);
Ic = closing(I, S);
Io = opening(I, S);

imwrite(Id, "rhino-part-dilation.png");
imwrite(Ie, "rhino-part-erosion.png");
imwrite(Ic, "rhino-part-closing.png");
imwrite(Io, "rhino-part-opening.png");
