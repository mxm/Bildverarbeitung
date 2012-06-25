Iw = imread("text-with-white-lines.png");
Ib = imread("text-with-black-lines.png");

S = [0 1 0; 1 1 1; 0 1 0];

Ic = closing(Iw, S);
Io = opening(Ib, S);

imwrite(Ic, "text-white-restored.png");
imwrite(Io, "text-black-restored.png");
