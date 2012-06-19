% enlarge given image b by factor 'stretch' with bilinear interpolation
function bw = bilinear(b, stretch = 2)
  bw = zeros(stretch * size(b));
  b = double(b);
  [br, bc] = size(b);
  for i=1:br-1
    for j=1:bc-1
      r = stretch * (i - 1) + 1;
      c = stretch * (j - 1) + 1;
      bw(r:r+2*stretch-1, c:c+2*stretch-1) = bilinear_4(b(i:i+1,j:j+1), 2* stretch);
    end
  end
end
