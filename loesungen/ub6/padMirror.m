function A = padMirror(A, x)
	A = horzcat(fliplr(A(:,[1:x])),A,fliplr(A(:,[end-x:end])));
	A = vertcat(flipud(A([1:x],:)),A,flipud(A([end-x:end],:)));
end;
