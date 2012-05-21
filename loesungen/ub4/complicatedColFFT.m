function A = complicatedColFFT(B, fb, b, isInverse)
	% size information
	n = size(B, 1);
	n2 = n / 2;
	% base case
	if n == b
		A = fb * B;
	% recurive case
	else
		% swap rows
		B = vertcat(B([1:2:n],:), B([2:2:n],:));
		% partition input into submatrices
		B11 = B([1:n2],[1:n2]);
		B12 = B([1:n2],[n2+1:n]);
		B21 = B([n2+1:n],[1:n2]);
		B22 = B([n2+1:n],[n2+1:n]);
		% recurse for submatrices
		FB11 = complicatedColFFT(B11, fb, b, isInverse);
		FB12 = complicatedColFFT(B12, fb, b, isInverse);
		FB21 = complicatedColFFT(B21, fb, b, isInverse);
		FB22 = complicatedColFFT(B22, fb, b, isInverse);
		% diagonal helper matrix with roots of unity
		H = ffthelper(n2);
		if (isInverse)
			H = conj(H);
		end;
		HFB21 = H * FB21;
		HFB22 = H * FB22;
		% calculate target submatrices
		A11 = FB11 + HFB21;
		A12 = FB12 + HFB22;
		A21 = FB11 - HFB21;
		A22 = FB12 - HFB22;
		% stitch together the submatrices
		Atop = horzcat(A11, A12);
		Abot = horzcat(A21, A22);
		A = vertcat(Atop, Abot);
		% scale
		A = A / sqrt(2);
	end;
end;
