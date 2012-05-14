function A = fftRC(B)
% 2-dimensional fast fourier transform
	A = fftR(fftC(B));
end;
