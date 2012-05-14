% load lena image
%LENA = imread("lena-bw.png");
LENA = imread("lena64.png");
B = padZero(LENA);

mwOrt = 1/9 * [1 1 1; 1 1 1; 1 1 1];

% execute mean filter in spatial domain
tic;
B1 = uint8(falte(B, mwOrt));
tOrt = toc;
printf("Zeit im Ortsraum: %.1f Sekunden\n", tOrt);

% execute mean filter in frequency domain

mwFreq = scaleFilter(mwOrt, size(LENA, 1));
filter = fftRC(mwFreq);

tic;
S = fftRC(double(LENA));
S1 = S .* filter;
R = ifftRC(S1);
tFreq = toc;
printf("Zeit im Frequenzraum: %.1f Sekunden\n", tFreq);
