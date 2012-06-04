function P = gaussPyramide(B)
	% create a gaussian pyramide and store it
	% in a linked list
	[h, w] = size(B);
	%printf("%d,%d\n", h, w);
	if (h == 1 || w == 1)
		% stop at size of 1
		P = struct("b", B);
		return;
	end;
	% otherwise, create a thumbnail and recurse
	% first, apply gaussian blurr if possible
	C = B;
	if (h > 2)
		C = falte(B, ones(5)/25);
	end;
	% then shrink the image
	thumb = shrink2x2(C);
	% recurse with thumbnail
	R = gaussPyramide(thumb);
	% append to the tail of the list
	P = struct("b", B, "next", R);
end;
