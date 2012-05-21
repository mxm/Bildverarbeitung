function result = normalize01(x)
% normalize a matrix such that the resulting matrix will have all values in the range from 0 to 1.
	minval = min(min(x));
	maxval = max(max(x));
	scale = maxval - minval
	x = x - minval;
	x = x / (maxval - minval);
	result = x;
end;
