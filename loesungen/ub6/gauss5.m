function A = gauss5()
	A = [1 2 4 2 1]' * [1 2 4 2 1];
	A = A / sum(sum(A));
end;
