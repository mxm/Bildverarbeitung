function A = padMirror(A)
	A = horzcat(A(:,1),A,A(:,end));
	A = vertcat(A(1,:),A,A(end,:));
end;
