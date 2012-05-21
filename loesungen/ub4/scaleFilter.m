function A = scaleFilter(filter, newSize)
% create a scaled version of a filter that may be used in frequency domain

A = zeros(newSize);

h = size(filter, 1);
w = size(filter, 2);

ys = 0;
xs = 0;
ye = ys + h;
xe = xs + w;

A([ys+1:ye],[xs+1:xe]) = filter;

% put the filter in the top left cornder and then
% shift the matrix so that the center of the filter is at the 
% first entry of the matrix (at position (1, 1))
vshift = -floor(h / 2);
hshift = -floor(w / 2);
A = shift(shift(A, vshift), hshift, 2);

end;
