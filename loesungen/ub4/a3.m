% load lena image
LENA = imread("lena-bw.png");
%LENA = imread("lena64.png");

mwOrt = 1/9 * [1 1 1; 1 1 1; 1 1 1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% execute mean filter in spatial domain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = padMirror(LENA);
tic;
B1 = uint8(falte(B, mwOrt));
tOrt = toc;
printf("Zeit im Ortsraum: %.1f Sekunden\n", tOrt);
B2 = crop(B1, 1);
imwrite(B2, "ausgabe.a3.ort.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prepare some filters within the frequency domain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prepare mean filter
mwFreq = scaleFilter(mwOrt, size(LENA, 1));
filter = fft2d(mwFreq, 32);

% prepare identity filter
nop = scaleFilter([1], size(LENA, 1));
nopFilter = fft2d(nop, 32);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% execute mean filter in frequency domain, with fft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;
S1 = fft2d(double(LENA), 32);
S2 = S1 .* filter;
R1 = ifft2d(S2, 32);
tFreq1 = toc;
printf("Zeit im Frequenzraum mit FFT: %.1f Sekunden\n", tFreq1);
R2 = real(R1) * size(S1, 1);
imwrite(uint8(R2), "ausgabe.a3.freq.fft.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% execute mean filter in frequency domain, with dft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load("f64");
%df = f64;
load("f512");
df = f512;
tic;
S3 = df * double(LENA) * df;
S4 = S3 .* filter;
R3 = df * S4 * df;
tFreq2 = toc;
printf("Zeit im Frequenzraum mit DFT: %.1f Sekunden\n", tFreq2);
R4 = real(R1) * size(S3, 1);
imwrite(uint8(R2), "ausgabe.a3.freq.dft.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create plots of spectral image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imwrite(uint8(real(S1) * 32), "ausgabe.a3.a.real.png");
imwrite(uint8(abs(S1) * 32), "ausgabe.a3.a.abs.png");
imwrite(uint8(imag(S1) * 32), "ausgabe.a3.a.imag.png");
imwrite(uint8(angle(S1) * 32), "ausgabe.a3.a.angle.png");
