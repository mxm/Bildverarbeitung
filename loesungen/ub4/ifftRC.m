function A = ifftRC(B)
% inverse 2-dimensional fast fourier transform
	A = ifftR(ifftC(B));
end;
