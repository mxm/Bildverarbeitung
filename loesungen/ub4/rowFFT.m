function A = rowFFT(B, b)
% simple wrapper method to apply fast rowwise fourier transform, recursion base is b
	fb = fn(b);
	A = complicatedRowFFT(B, fb, b, false);
end;
