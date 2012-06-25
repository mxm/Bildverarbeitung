function O = closing(I, S)
	O = erosion(dilation(I, S), S);
end;
