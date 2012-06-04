function A = enlarge2(B)
% double the size of an image by applying copying each pixel 4 times
% to generate unknown pixels
	[h, w] = size(B);	
	A = zeros(h * 2, w * 2);
	% first insert original image's values
	A([1:2:h*2-1],[1:2:w*2-1]) = B;
	A([2:2:h*2],[1:2:w*2-1]) = B;
	A([1:2:h*2-1],[2:2:w*2]) = B;
	A([2:2:h*2],[2:2:w*2]) = B;
end;
