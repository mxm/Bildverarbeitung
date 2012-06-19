function val = percentile(X, p)
	% return the value that p * length(X) 
	% values of X are smaller or equal to.
	S = sort(X);
	len = size(S, 1);
	pos = round(p * len) + 1;
	percent = pos / len;
	val = S(pos);
end;
