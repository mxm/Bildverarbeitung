I = imread("lanes-bw.png");

for x = [1:1000]
	x = rand * 10;
	y = rand * 10;
	g = rand * 2;
	n = sprintf("lanes3/lanes-%.2f-%.2f-%.2f.png", x, y, g);
	printf("%s\n", n);
	O = edge(I, 'canny', [x, y], g);
	imwrite(uint8(O*255), n);
end;
