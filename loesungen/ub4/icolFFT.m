function A = icolFFT(B, b)
	fb = conj(fn(b));
	A = complicatedColFFT(B, fb, b, true);
end;
