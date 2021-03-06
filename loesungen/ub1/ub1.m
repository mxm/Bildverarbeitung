h2 = 1 / sqrt(2) * [1,1;1,-1];
h4 = 1 / sqrt(2) * [h2, h2; h2, -h2];
h8 = 1 / sqrt(2) * [h4, h4; h4, -h4];
h16 = 1 / sqrt(2) * [h8, h8; h8, -h8];
h32 = 1 / sqrt(2) * [h16, h16; h16, -h16];
h64 = 1 / sqrt(2) * [h32, h32; h32, -h32];
h128 = 1 / sqrt(2) * [h64, h64; h64, -h64];
h256 = 1 / sqrt(2) * [h128, h128; h128, -h128];
h512 = 1 / sqrt(2) * [h256, h256; h256, -h256];

b1 = [128, 64; 16, 32] ;
b2 = [17, 205; 205, 17];
b3 = [0, 204, 102, 204; 204, 255, 51, 51; 204, 102, 153, 51; 153, 51, 51, 0];

# nomalisiere Matrix x mit dem größten vorkommenden Wert
function result = normalizeAuto(x)
	maximum = max(max(x));
	result = double(x) / maximum * 2 - 1;
end;

# denomalisiere Matrix x mit dem Wert factor (Rückskalieren auf ursprünglichen Wertebereich)
function result = denormalize(x, factor)
	result = (x + 1) / 2.0 * factor;
end;

function result = normalizePicture(x)
	result = double(x) / 255.0 * 2 - 1;
end;

function result = denormalizeToPicture(x)
	result = uint8((x + 1) / 2.0 * 255); 
end;




# Werte einer Matrix auf den Bereich [0..1] skalieren
function result = normalize01(x)
	minval = min(min(x))
	maxval = max(max(x))
	x = x - minval;
	x = x / (maxval - minval)
	result = x;
end;

function result = lowpass(x, threshold)
	y = x;
	y(find (y > threshold)) = 0;
	result = y;
end;
