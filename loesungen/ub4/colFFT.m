function A = colFFT(B, b)
% simple wrapper method to apply fast colwise fourier transform, recursion base is b
	fb = fn(b);
	A = complicatedColFFT(B, fb, b, false);
end;
