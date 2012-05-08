function A = padZero(A)
	A = [zeros(size(A,1),1) A];
	A = [zeros(1,size(A,2));A];
	A(end+1,:) = 0;
	A(:,end+1) = 0;
end;

function A = padMirror(A)
	A = horzcat(A(:,1),A,A(:,end));
	A = vertcat(A(1,:),A,A(end,:));
end;

function B = falte(A, k)
	A = int32(A);
	B = zeros(size(A));
	%Ap = padZero(A);
	Ap = padMirror(A);
	for i = 1 : size(A, 1)
		for j = 1 : size(A, 2)
			B(i,j) = sum(sum(k .* Ap(i:i+2,j:j+2)));
		end
	end
end;

skyname = "sky2.png"
skyname = "skyline-bw.png"

Identity = 1/9 * [0 0 0; 0 9 0; 0 0 0];
Mittelwert = 1/9 * [1 1 1; 1 1 1; 1 1 1];
Gauss = 1/16 * [1 2 1; 2 4 2; 1 2 1];
SobelX = [1 0 -1; 2 0 -2; 1 0 -1];
SobelY = [1 2 1; 0 0 0; -1 -2 -1];
Laplace4 = [0 -1 0; -1 4 -1; 0 -1 0];
Laplace8 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

SKY = imread(skyname);

%SKY_MW = falte(SKY, Mittelwert);
%imwrite(uint8(SKY_MW), "sky-mw.png")
%
%SKY_GAUSS = falte(SKY, Gauss);
%imwrite(uint8(SKY_GAUSS), "sky-gauss.png")
%
%SKY_LAPLACE4 = falte(SKY, Laplace4);
%imwrite(uint8(SKY_LAPLACE4 / 4 + 127), "sky-laplace4.png");
%
%SKY_LAPLACE8 = falte(SKY, Laplace8);
%imwrite(uint8(SKY_LAPLACE8 / 8 + 127), "sky-laplace8.png");
%
%SKY_SOBELX = falte(SKY, SobelX);
%imwrite(uint8(SKY_SOBELX / 8 + 127), "sky-sobelx.png");
%
%SKY_SOBELY = falte(SKY, SobelY);
%imwrite(uint8(SKY_SOBELY / 8 + 127), "sky-sobely.png");
%
%SKY_SOBELXY = sqrt(SKY_SOBELX .* SKY_SOBELX + SKY_SOBELY .* SKY_SOBELY);
%imwrite(uint8(SKY_SOBELXY/1414 * 255), "sky-sobelxy.png");

function B = maxfilter(A)
	A = int32(A);
	B = zeros(size(A));
	%Ap = padZero(A);
	Ap = padMirror(A);
	for i = 1 : size(A, 1)
		for j = 1 : size(A, 2)
			B(i,j) = max(max(Ap(i:i+2,j:j+2)));
		end
	end
end;

function B = minfilter(A)
	A = int32(A);
	B = zeros(size(A));
	%Ap = padZero(A);
	Ap = padMirror(A);
	for i = 1 : size(A, 1)
		for j = 1 : size(A, 2)
			B(i,j) = min(min(Ap(i:i+2,j:j+2)));
		end
	end
end;

function B = medianfilter(A)
	A = int32(A);
	B = zeros(size(A));
	%Ap = padZero(A);
	Ap = padMirror(A);
	for i = 1 : size(A, 1)
		for j = 1 : size(A, 2)
			P = Ap(i:i+2,j:j+2);
			B(i,j) = median([P(1,:),P(2,:),P(3,:)]);
		end
	end
end;

LENA = imread("lena-bw-noise.png");
%LENA = imread("lena-bw-noise-small.png");

%LENA_MEDIAN = medianfilter(LENA);
%imwrite(uint8(LENA_MEDIAN), "lena-median.png")
%
%LENA_MAX = maxfilter(LENA);
%imwrite(uint8(LENA_MAX), "lena-max.png")
%
%LENA_MIN = minfilter(LENA);
%imwrite(uint8(LENA_MIN), "lena-min.png")
