function A = scaleFilterBad1(filter, newSize)
% create a scaled version of a filter that may be used in frequency domain

A = zeros(newSize);

h = size(filter, 1);
w = size(filter, 2);

% put the filter in the middle
ys = round((newSize - h) / 2);
xs = round((newSize - w) / 2);
ye = ys + h;
xe = xs + w;

A([ys+1:ye],[xs+1:xe]) = filter;

end;
