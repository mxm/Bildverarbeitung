function o = nearreal(X, eps)
% test whether all values' imaginary component within the matrix is below a certain epsilon
	if max(max(abs(imag(X)))) > eps
		o = 0;
	else
		o = 1;
	end
end
