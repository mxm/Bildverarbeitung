function A = compress(B, values)
	A = B;
	H = haar(B);

	for i = values
		cutOff = percentile(H, i);
		HM = setToZeroAbs(H, cutOff);
		M = ihaar(HM);
		A = horzcat(A, M);
	end;

end;
