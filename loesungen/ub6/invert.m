function Q = invert(P)
% invert a pyramide (inversion of the linked list)
	Q= struct("b", P.b);
	PI = P.next;
	while(1)
		B = PI.b;
		Q = struct("b", B, "next", Q);
		[h,w] = size(B);
		if (!isfield(PI, "next"))
			break;
		end;
		PI = PI.next;
	end;
end;
