function A = ihaarSingleCol(B, depth = 0)
% revert the haar transform of a single column
	h = size(B, 1); % the size of the current vector
	if h == 2 % stop recursion if h = 2
		% the first two values are calculated from
		% the last two entries of the vector
		A = [B(1) + B(2); B(1) - B(2)] / sqrt(2);
	else
		% we deduct one part by adding and the
		% other by subtracting parts of the vector
		S = ihaarSingleCol(B(1:h/2), depth + 1);
		T = B(h/2+1:end);
		A = [S + T; S - T] / sqrt(2);
		% fancy permutation to reorder rows
		sel = [rem([0:h-2]*h/2, h-1) h-1] + 1;
		A = A(sel);
	end;
end;
