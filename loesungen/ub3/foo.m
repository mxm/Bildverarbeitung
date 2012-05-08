function A = cutHighAbs(B, p)
	A = B;
	S = abs(A);
	cut = percentile(S(:), p);
	A(find(S > cut)) = 0;
end;

function A = cutHighImag(B, p)
	A = B;
	S = imag(A);
	cut = percentile(S(:), p);
	A(find(S > cut)) = 0;
end;

function A = cutHighReal(B, p)
	A = B;
	S = real(A);
	cut = percentile(S(:), p);
	A(find(S > cut)) = 0;
end;

function A = cutHighAngle(B, p)
	A = B;
	S = angle(A);
	cut = percentile(S(:), p);
	A(find(S > cut)) = 0;
end;
