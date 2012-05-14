function A = padZero(A)
	A = [zeros(size(A,1),1) A];
	A = [zeros(1,size(A,2));A];
	A(end+1,:) = 0;
	A(:,end+1) = 0;
end;
