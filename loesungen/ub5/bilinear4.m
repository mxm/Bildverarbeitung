function A = bilinear4(B)
% increase the size of an image by factor four by applying 
% bilinear interpolation to generate unknown pixels
	A = bilinear2(bilinear2(B));
end;
