B = imread("lanes-bw.png");
I = imread("lanes-bw-canny.png");
%I = imread("test.png");

alphasteps = 256;
alphasteps = 512;
O = hough(I, alphasteps);

% create an image
O1 = O;
O1(find(O1 > 255)) = 255; % cut off too big values
imwrite(uint8(255-O1), "lanes-hough.png");

% supress non maxima
O2 = nms(O);

% create another image
O3 = O2;
O3(find(O3 > 255)) = 255; % cut off too big values
imwrite(uint8(255-O3), "lanes-hough-nms.png");

% find maxima
imshow(B);
hold on;
[h,w] = size(B);
[ds,alphas] = find(O2 > 80)
alphas = alphas / alphasteps * pi;
ys = ds./sin(alphas);
yws = (ds-w*cos(alphas))./sin(alphas);
xs = ds./cos(alphas);
n = size(ys,1);
for k = 1:n
	x = [0 w];
	y = [ys(k) yws(k)];
	plot(x, y);
end;
print("foo.png");
