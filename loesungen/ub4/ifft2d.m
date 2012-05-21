function A = ifft2d(B, b)
% inverse 2-dimensional fast fourier transform
	A = irowFFT(icolFFT(B, b), b);
end;
