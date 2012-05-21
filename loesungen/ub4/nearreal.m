function o = nearreal(X, eps)
	if max(max(abs(imag(X)))) > eps
		o = 0;
	else
		o = 1;
	end
end
