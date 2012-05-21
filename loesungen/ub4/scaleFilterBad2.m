function A = scaleFilterBad2(filter, newSize)
% create a scaled version of a filter that may be used in frequency domain

A = zeros(newSize);

h = size(filter, 1);
w = size(filter, 2);

% put the filter at the top left corner
ys = 0;
xs = 0;
ye = ys + h;
xe = xs + w;

A([ys+1:ye],[xs+1:xe]) = filter;

end;
