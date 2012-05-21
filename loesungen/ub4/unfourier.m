function A = unfourier(B) % Rücktransformation
% inverse discrete fourier transformation
	f64 = fn(64);
	A = real(conj(f64) * B * conj(f64'));
end;

