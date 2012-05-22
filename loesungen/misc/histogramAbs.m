function H = histogramAbs(A)
	H = zeros(1, 256);
	for i = 1 : size(A, 1) * size(A,2)
		H(A(i) + 1) += 1;
	end
end;
