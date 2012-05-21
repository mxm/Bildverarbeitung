function A = padZero(A)
% pad a picture with one row and col of zeros each side
	A = [zeros(size(A,1),1) A];
	A = [zeros(1,size(A,2));A];
	A(end+1,:) = 0;
	A(:,end+1) = 0;
end;
