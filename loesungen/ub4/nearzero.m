function o = nearzero(X, eps)
% test whether all values length within the matrix is below a certain epsilon
	if max(max(abs(X))) > eps
		o = 0;
	else
		o = 1;
	end
end
