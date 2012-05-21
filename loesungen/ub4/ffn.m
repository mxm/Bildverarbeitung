function A = ffn(n)
% create a fourier matrix with the specified dimension, optimized version which is a little faster
	gen = einheitswurzel(n, 1);
	rootofn = 1 / sqrt(n);
	A = arrayfun(@(x) rootofn * power(gen, x), [0:(n-1)]' * [0:(n-1)]);
end;
