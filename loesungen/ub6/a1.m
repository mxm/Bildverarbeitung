LENA = imread("lena-bw.png");
%LENA = imread("lena64.png");

%%% part a
% create gaussian pyramide

P = gaussPyramide(LENA);

% save all images of the pyramide in files
PI = P;
while(1)
	B = PI.b;
	[h,w] = size(B);
	name = sprintf("lena.gauss.pyramid.%d.png", w);
	printf("size: %d,%d, name: %s\n", h, w, name);
	imwrite(uint8(B), name);
	if (!isfield(PI, "next"))
		break;
	end;
	PI = PI.next;
end;

%%% part b
% create laplacian pyramide

L = laplacePyramide(LENA);

% save all images of the pyramide in files
LI = L;
while(1)
	B = LI.b;
	[h,w] = size(B);
	name = sprintf("lena.laplace.pyramid.%d.png", w);
	printf("size: %d,%d, name: %s\n", h, w, name);
	imwrite(normalize0255(B), name);
	if (!isfield(LI, "next"))
		break;
	end;
	LI = LI.next;
end;

%%% part c
% reconstruct image and save reconstructed images

Li = invert(L); % we need the pyramide starting with 1px
G = Li.b; % base image
LI = Li.next; %iterator
while(1)
	B = LI.b;
	[h,w] = size(B);
	name = sprintf("lena.reconstructed.%d.png", w);
	printf("size: %d,%d, name: %s\n", h, w, name);
	% compute reconstructed image
	R = bilinear2(G) + B;
	imwrite(uint8(R), name);
	G = R;
	if (!isfield(LI, "next"))
		break;
	end;
	LI = LI.next;
end;
