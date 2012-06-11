function A = haarCols(B)
	[h, w] = size(B);
	A = zeros(h, w);
	for i = [1 : w]
		A(:,i) = haarSingleCol(B(:,i));
	end;
end;
