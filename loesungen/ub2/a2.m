function H = histogramAbs(A)
	H = zeros(1, 256);
	for i = 1 : size(A, 1) * size(A,2)
		H(A(i) + 1) += 1;
	end
end;

function H = histogramRel(A)
	H = histogramAbs(A) / (size(A, 1) * size(A,2));
end;

function H = histogramRelCum(A)
	H = histogramRel(A);
	for i = 2 : size(H, 2)
		H(i) = H(i) + H(i - 1);
	end
end;

function A = histAusgleich(A)
	H = histogramRelCum(A);
	for i = 1 : size(A, 1) * size(A,2)
		A(i) = H(A(i) + 1) * 255;
	end
end;

LENA1 = imread("lena-bw-lc1.bmp");
LENA2 = imread("lena-bw-lc2.bmp");
LENA3 = imread("lena-bw-lc3.bmp");

%LENA1 = imread("lc1.png");
%LENA2 = imread("lc2.png");
%LENA3 = imread("lc3.png");

%bar([0:255], histogramAbs(LENA1));
%print("abs1.png");
%
%bar([0:255], histogramAbs(LENA2));
%print("abs2.png");
%
%bar([0:255], histogramAbs(LENA3));
%print("abs3.png");
%
%bar([0:255], histogramRelCum(LENA1))
%axis([1,256,0,1]);
%print("relcum1.png");
%
%bar([0:255], histogramRelCum(LENA2))
%axis([1,256,0,1]);
%print("relcum2.png");
%
%bar([0:255], histogramRelCum(LENA3))
%axis([1,256,0,1]);
%print("relcum3.png");

%imwrite(histAusgleich(LENA1), "ausgeglichen1.png");
%imwrite(histAusgleich(LENA2), "ausgeglichen2.png");
%imwrite(histAusgleich(LENA3), "ausgeglichen3.png");

