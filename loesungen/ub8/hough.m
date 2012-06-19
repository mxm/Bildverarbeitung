function O = hough(I, alphasteps)
% create a hough transform of the input image
	[h, w] = size(I)
	% maximal distance possible (diagonal)
	maxd = ceil(sqrt(h*h+w*w))
	% resulting hough space
	O = zeros(maxd, alphasteps);

	% discrete angles	
	steps = [1:alphasteps];
	radians = steps / alphasteps * pi;

	% find non-zero entries
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
		% calculate values for d
		ds = abs(round(x * cos(radians) + y * sin(radians)));
		% select only valid alpha positions
		alphas = find(ds > 0 & ds < maxd);
		% recalculate index of the (alpha,d) entry
		i  = (alphas-1) * maxd + ds(alphas);
		% cumulate values
		O(i) += 1;
	end;
end;
