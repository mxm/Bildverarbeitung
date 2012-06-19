I = imread("lanes-bw.png");

for x = [0.1:0.1:4]
	for y = [x:0.1:4]
		n = sprintf("lanes-%.2f-%.2f.png", x, y);
		printf("%s\n", n);
		O = edge(I, 'canny', [x, y]);
		imwrite(uint8(O*255), n);
	end;
end;
