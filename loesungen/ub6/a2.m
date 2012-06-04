MASK = imread("eye-mask.png");
HAND = imread("hand-bw.png");
EYE = imread("eye-bw.png");

Pmask = gaussPyramide(MASK);
Lhand = laplacePyramide(HAND);
Leye = laplacePyramide(EYE);

M = invert(Pmask);
A = invert(Lhand);
B = invert(Leye);

%% create mixed image's laplace pyramid
% G
GA = A.b;
GB = B.b;
GX = M.b/255 * GA + (1-M.b/255) * GB;
X = struct("b", GX);
% iterators
MI = M.next;
AI = A.next;
BI = B.next;
% loop
while(1)
	LX = (MI.b/255) .* BI.b + (1-MI.b/255) .* AI.b;
	X = struct("b", LX, "next", X);
	if (!isfield(MI, "next"))
		break;
	end;
	MI = MI.next;
	AI = AI.next;
	BI = BI.next;
end;

%% reconstruct image from laplace pyramid
X = invert(X);
G = X.b;
LI = X.next;
while(1)
	B = LI.b;
	[h,w] = size(B);
	name = sprintf("mixed.%d.png", w);
	printf("size: %d,%d, name: %s\n", h, w, name);
	R = enlarge2(G) + B;
	imwrite(uint8(R), name);
	G = R;
	if (!isfield(LI, "next"))
		break;
	end;
	LI = LI.next;
end;
