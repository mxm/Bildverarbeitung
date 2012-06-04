function result = normalize0255(x)
% normalize a matrix such that the resulting matrix will have all values in the range from 0 to 255.
	minval = min(min(x));
	maxval = max(max(x));
	scale = maxval - minval;
	x = x - minval;
	if (scale != 0)
		x = x / scale;
	end;
	result = uint8(x * 255);
end;
