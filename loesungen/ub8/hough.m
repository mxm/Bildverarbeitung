function O = hough(I, alphasteps)
% create a hough transform of the input image
	[h, w] = size(I)
	maxd = ceil(sqrt(h*h+w*w))
	O = zeros(maxd, alphasteps);
	
	steps = [1:alphasteps];
	radians = steps / alphasteps * pi;

	[bys,bxs] = find(I);

	% move the origin to the center of the image
	%xs = bxs - w / 2;
	%ys = bys - h / 2;

	% keep the origin at the top left corner of the image
	xs = bxs;
	ys = bys;

	for p = 1:size(xs, 1)
		x = xs(p);
		y = ys(p);
		ds = abs(round(x * cos(radians) + y * sin(radians)));
		alphas = find(ds > 0 & ds < maxd);
		i  = (alphas-1) * maxd + ds(alphas);
		O(i) += 1;
	end;
end;
