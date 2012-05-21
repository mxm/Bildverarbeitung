function A = complicatedRowFFT(B, fb, b, isInverse)
	% size information
	n = size(B, 1);
	n2 = n / 2;
	% base case
	if n == b
		A = B * fb;
	% recurive case
	else
		% swap columns
		B = horzcat(B(:,[1:2:n]), B(:,[2:2:n]));
		% partition input into submatrices
		B11 = B([1:n2],[1:n2]);
		B12 = B([1:n2],[n2+1:n]);
		B21 = B([n2+1:n],[1:n2]);
		B22 = B([n2+1:n],[n2+1:n]);
		% recurse for submatrices
		FB11 = complicatedRowFFT(B11, fb, b, isInverse);
		FB12 = complicatedRowFFT(B12, fb, b, isInverse);
		FB21 = complicatedRowFFT(B21, fb, b, isInverse);
		FB22 = complicatedRowFFT(B22, fb, b, isInverse);
		% diagonal helper matrix with roots of unity
		H = ffthelper(n2);
		if isInverse
			H = conj(H);
		end;
		HFB12 = FB12 * H;
		HFB22 = FB22 * H;
		% calculate target submatrices
		A11 = FB11 + HFB12;
		A12 = FB11 - HFB12;
		A21 = FB21 + HFB22;
		A22 = FB21 - HFB22;
		% stitch together the submatrices
		Atop = horzcat(A11, A12);
		Abot = horzcat(A21, A22);
		A = vertcat(Atop, Abot);
		% scale
		A = A / sqrt(2);
	end;
end;
