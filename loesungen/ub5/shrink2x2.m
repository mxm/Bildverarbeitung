function A = shrink2x2(B)
% shrink an image to a quarter of its original size by calculating the mean 
% of each 2x2 of the original image to create 1 pixel of the new image.
	Bd = double(B);
	[h, w] = size(B);
	A = zeros(h / 2, w / 2);
	for y = 1 : (h / 2)
		for x = 1 : (w / 2)
			A(y, x) = (ones(1,2) * Bd(y*2-1:y*2, x*2-1:x*2) * ones(2, 1)) / 4;
		end;
	end;
end;
