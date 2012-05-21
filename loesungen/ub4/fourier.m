function A = fourier(B) % Transformation
% discrete fourier transformation
	f64 = fn(64);
	A = f64 * complex(B) * f64';
end;
