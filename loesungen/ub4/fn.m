function A = fn(n)
% create a fourier matrix with the specified dimension
	wurzeln = arrayfun(@(x) 1 / sqrt(n) * einheitswurzel(n, x), [0:(n-1)]);
	A = arrayfun(@(x) wurzeln(mod(x, n)+1), [0:(n-1)]' * [0:(n-1)]);
end;
