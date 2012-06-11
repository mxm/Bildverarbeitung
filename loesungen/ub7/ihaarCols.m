function A = ihaarCols(B)
	[h, w] = size(B);
	A = zeros(h, w);
	for i = [1 : w]
		A(:,i) = ihaarSingleCol(B(:,i));
	end;
end;
