function O = nms(I)
% non maximum supression
	[h, w] = size(I);
	O = zeros(h, w);
	I = padZero(I);
	for y = 2:h-1
		for x = 2:w-1
			P = I(y-1:y+1,x-1:x+1);
			m = max(P(:));
			if I(y,x) >= m
				O(y-1,x-1) = I(y,x);
			end;
		end;
	end;
end;
