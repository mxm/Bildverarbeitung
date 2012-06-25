function O = gs_opening(I, S)
	O = gs_dilation(gs_erosion(I, S), S);
end;
