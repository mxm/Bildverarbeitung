function B = falte(A, k)
% apply the convolution operator on a matrix A with the filter k
% assuming that k has odd width and height and is quadratic.
	[h,w] = size(k);
	s = h - 1;
	pad = (h - 1) / 2;
	A = double(A);
	B = zeros(size(A));
	Ap = padMirror(A, pad);
	for i = 1 : size(A, 1)
		for j = 1 : size(A, 2)
			B(i,j) = sum(sum(k .* Ap(i:i+s,j:j+s)));
		end
	end
end;
