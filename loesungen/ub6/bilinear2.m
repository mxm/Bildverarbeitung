function A = bilinear2(B)
% double the size of an image by applying bilinear interpolation 
% to generate unknown pixels
	[h, w] = size(B);	
	A = zeros(h * 2, w * 2);
	% first insert original image's values
	A([1:2:h*2-1],[1:2:w*2-1]) = B;
	% then interpolate horizontally
	for y = [1:2:h*2-1]
		for x = [2:2:w*2-1]
			A(y,x) = (A(y,x-1) + A(y,x+1))/2;
		end;
	end;
	% then interpolate vertically
	for y = [2:2:h*2-1]
		for x = [1:w*2-1]
			A(y,x) = (A(y-1,x) + A(y+1,x))/2;
		end;
	end;
	A(end,:) = A(end-1,:);
	A(:,end) = A(:,end-1);
end;
