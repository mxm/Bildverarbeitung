function O = opening(I, S)
	O = dilation(erosion(I, S), S);
end;
