Iw = imread("rhino-part-bin-with-white-lines.png");
Ib = imread("rhino-part-bin-with-black-lines.png");

S = [0 1 0; 1 1 1; 0 1 0];

Ic = closing(Iw, S);
Io = opening(Ib, S);

imwrite(Ic, "rhino-part-white-restored.png");
imwrite(Io, "rhino-part-black-restored.png");
