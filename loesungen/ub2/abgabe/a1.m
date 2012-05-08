B = [52 116 67 72 129 54; 106 166 134 149 133 94; 57 113 116 123 92 47; 15 58 76 77 66 9; 1 5 46 61 13 1; 0 0 0 2 0 0];

k = 1/9 * [1 1 1; 1 1 1; 1 1 1];

function A = padZero(A)
	A = [zeros(size(A,1),1) A];
	A = [zeros(1,size(A,2));A];
	A(end+1,:) = 0;
	A(:,end+1) = 0;
end;

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

B
falte(B, k)
