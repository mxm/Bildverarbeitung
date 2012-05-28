function A = shrink4x4(B)
% shrink an image to a sixteenth of its original size by calculating the mean 
% of each 4x4 of the original image to create 1 pixel of the new image.
	Bd = double(B);
	[h, w] = size(B);
	A = zeros(h / 4, w / 4);
	for y = 1 : (h / 4)
		for x = 1 : (w / 4)
			A(y, x) = (ones(1,4) * Bd(y*4-3:y*4, x*4-3:x*4) * ones(4, 1)) / 16;
		end;
	end;
end;
