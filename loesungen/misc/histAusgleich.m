function A = histAusgleich(A)
	H = histogramRelCum(A);
	for i = 1 : size(A, 1) * size(A,2)
		A(i) = H(A(i) + 1) * 255;
	end
end;
