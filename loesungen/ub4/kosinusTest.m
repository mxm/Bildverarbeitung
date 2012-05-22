function [B, B1, B2, K, KN, C, ok] = kosinusTest(name)
% read image to B
% create mirrored images in B1, B2
% cosine transformation of B2 in K
% back-transformed image in C
% ok is true if imaginary part of K is about zero
% KN contains a kind-of normalized version of 
	B = imread(name);
	% mirror
	B1 = horzcat(B, fliplr(B)(:,1:end-1));
	B2 = vertcat(B1, flipud(B1)(1:end-1,:));
	% size
	[h, w] = size(B2);
	% fourier matrices
	fLeft = ffn(h);
	fRight = ffn(w);
	% transform
	K = fLeft * double(B2) * fRight;
	% transform back
	C = conj(fLeft) * K * conj(fRight);
	% test result
	ok = nearreal(K, 0.00001)
	% normalize result to grayscale
	KN = uint8(normalize(real(K), -10, 50) * 255);
	% creat some image files
	basename = name([1:1:end-4]);
	imwrite(B1, ["a2.", basename, ".mirror1.png"]);
	imwrite(B2, ["a2.", basename, ".mirror2.png"]);
	imwrite(KN, ["a2.", basename, ".spektrum.png"]);
end;
