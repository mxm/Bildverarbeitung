function A = fft2d(B, b)
% 2-dimensional fast fourier transform
	A = rowFFT(colFFT(B, b), b);
end;
