function H = histogramRel(A)
	H = histogramAbs(A) / (size(A, 1) * size(A,2));
end;
