function P = laplacePyramide(B)
	% create a gaussian pyramide and store it
	% in a linked list

	% ensure we don't have uint8 anymore
	B = double(B);
	[h, w] = size(B);
	printf("%d,%d\n", h, w);
	% easy case, size of 1, break
	if (h == 1 || w == 1)
		P = struct("b", B);
		return;
	end;
	% prepare the shrinked image
	% with gaussian blurr if possible
	C = B;
	if (h > 2)
		C = falte(B, gauss5);
	end;
	% create the thumbnail
	thumb = shrink2x2(C);
	% sample up again
	reenlarged = bilinear2(thumb);
	% subtract from original image
	L = B - reenlarged;
	% recurse
	R = laplacePyramide(thumb);
	P = struct("b", L, "next", R);
end;
