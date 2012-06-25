function O = gs_erosion(I, S)
	[h, w] = size(I);	
	[sh, sw] = size(S);
	oh = h - sh;
	ow = w - sw;
	O = zeros(oh, ow);
	for i = [1:oh]
		for j = [1:ow]
			P = I(i:i+sh-1, j:j+sw-1) - S;
			O(i, j) = min(P(:));
		end;
	end;
end;
