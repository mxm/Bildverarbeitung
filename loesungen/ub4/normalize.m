function result = normalize(x, a, b)
% normalize a matrix such that the resulting matrix will have all values in the range from 0 to 1.
	x = x - a;
	x = x / (b - a);
	result = x;
end;
