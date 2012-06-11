function A = setToZeroAbs(B, epsilon)
	A = B;
	A(find(abs(A) < epsilon)) = 0;
end;
