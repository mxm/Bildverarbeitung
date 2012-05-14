function A = ffthelper(n)
	A = zeros(n);
	for (i = 1 : n)
		A(i, i) = einheitswurzel(2*n,i-1);
	end;
end;
