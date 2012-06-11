function A = haarSingleCol(B)
% apply the haar transform to a single column
	h = size(B, 1);
	A = zeros(h, 1); % overall result
	gpu = zeros(h / 2, 1); % result of add
	gmu = zeros(h / 2, 1); % result of sub
	for i = [1 : h/2] % calculate add
		gpu(i) = (B((i-1)*2 + 1) + B((i-1)*2 + 2)) / sqrt(2);
	end;
	for i = [1 : h/2] % calculate sub
		gmu(i) = (B((i-1)*2 + 1) - B((i-1)*2 + 2)) / sqrt(2);
	end;
	A(h/2+1:end) = gmu;
	if h == 2
		% stop for length 2
		A(1) = gpu;
	else
		% recurse into one half
		A(1:h/2) = haarSingleCol(gpu);
	end;
end;
