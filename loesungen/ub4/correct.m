% test the correctness of all FFT implementations by comparing to the 
% results of the discrete fourier transformation.

% all tests should return 1

% original data
LENA64 = imread("lena64.png");
B = double(LENA64);
% comparism values
RS = B * fn(64);
CS = fn(64) * B;
S = fn(64) * B * fn(64);

% test 1-dimensional transformation with different recursion bases
nearzero(rowFFT(B, 2) - RS, 0.000001)
nearzero(colFFT(B, 2) - CS, 0.000001)

nearzero(rowFFT(B, 4) - RS, 0.000001)
nearzero(colFFT(B, 4) - CS, 0.000001)

nearzero(rowFFT(B, 8) - RS, 0.000001)
nearzero(colFFT(B, 8) - CS, 0.000001)

% test 1-dimensional inverse transformation with different recursion bases
nearzero(irowFFT(RS, 2) - B, 0.000001)
nearzero(icolFFT(CS, 2) - B, 0.000001)

nearzero(irowFFT(RS, 4) - B, 0.000001)
nearzero(icolFFT(CS, 4) - B, 0.000001)

nearzero(irowFFT(RS, 8) - B, 0.000001)
nearzero(icolFFT(CS, 8) - B, 0.000001)

% test 2-dimensional transformation with different recursion bases
nearzero(fft2d(B, 2) - S, 0.000001)
nearzero(fft2d(B, 4) - S, 0.000001)
nearzero(fft2d(B, 8) - S, 0.000001)

% test 2-dimensional inverse transformation with different recursion bases
nearzero(ifft2d(S, 2) - B, 0.000001)
nearzero(ifft2d(S, 4) - B, 0.000001)
nearzero(ifft2d(S, 8) - B, 0.000001)
