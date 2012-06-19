B = imread("skyline-bw.png");
I = imread("sky-sobelxy.png");

% discretetize angle with 'alphasteps' steps
alphasteps = 512;
% perform hough transformation
O = hough(I, alphasteps);

% create an image of the result
O1 = O;
O1(find(O1 > 255)) = 255; % cut off too big values
imwrite(uint8(255-O1), "skyline-hough.png");

% supress non maxima
O2 = nms(O);

% create another image of the local maxima
O3 = O2;
O3(find(O3 > 255)) = 255; % cut off too big values
imwrite(uint8(255-O3), "skyline-hough-nms.png");

% find global maxima with thresholding
[ds,alphas] = find(O2 > 80);

% draw lines on the original image
imshow(B);
hold on;
[h,w] = size(B);
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
print("skyline-result.png");
