function A = ffthelper(n)
% shifting function needed within the fft
	A = zeros(n);
	for (i = 1 : n)
		A(i, i) = einheitswurzel(2*n,i-1);
	end;
end;
