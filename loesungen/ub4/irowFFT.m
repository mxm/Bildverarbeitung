function A = irowFFT(B, b)
	fb = conj(fn(b));
	A = complicatedRowFFT(B, fb, b, true);
end;
