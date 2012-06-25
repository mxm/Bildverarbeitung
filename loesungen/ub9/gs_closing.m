function O = gs_closing(I, S)
	O = gs_erosion(gs_dilation(I, S), S);
end;
