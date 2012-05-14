function A = ifftR(B)
	% size information
	n = size(B, 1);
	n2 = n / 2;
	% base case
	if n == 2
		A = B * fn(2);
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
		FB11 = ifftR(B11);
		FB12 = ifftR(B12);
		FB21 = ifftR(B21);
		FB22 = ifftR(B22);
		% diagonal helper matrix with roots of unity
		H = ffthelper(n2);
		% conjugate H
		H = conj(H);
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
