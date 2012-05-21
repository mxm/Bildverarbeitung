function A = crop(A, n)
% crop one pixel line from each side of a matrix. Useful for transforming back padded images.
	A = A(n+1:end-n,n+1:end-n);
end;
