function B = falte(A, k)
	A = int32(A);
	B = zeros(size(A));
	Ap = padZero(A);
	for i = 1 : size(A, 1)
		for j = 1 : size(A, 2)
			B(i,j) = sum(sum(k .* Ap(i:i+2,j:j+2)));
		end
	end
end;
