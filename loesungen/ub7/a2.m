values = [0.5 0.6 0.7 0.8 0.9 0.95 0.97];

for pic = {"lena", "old-lady"}
%for pic = {"lena64"}
	pic = pic{1};
	src = sprintf("%s-bw.png", pic)

	B = normalize(imread(src));
	w = size(B, 2);
	C = compress(B, values);

	for i = [1:size(values, 2)]
		value = values(i);
		name = sprintf("%s.compressed.%.2f.png", pic, value)
		p = ((i-1) * w);
		Ci = uint8(denormalize(C(:,[p + 1:p + w])));
		imwrite(Ci, name);
	end;
end;
