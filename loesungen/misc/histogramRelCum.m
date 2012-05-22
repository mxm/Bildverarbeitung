function H = histogramRelCum(A)
	H = histogramRel(A);
	for i = 2 : size(H, 2)
		H(i) = H(i) + H(i - 1);
	end
end;
