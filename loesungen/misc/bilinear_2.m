% expects any vector, values between first and last element are bilinear
% interpolated
function bw = bilinear_2(r)
  bw = r;
  a = bw(1);
  b = bw(end);
  s = max(size(r))-1;
  for i=1:s-1
    bw(i+1) = (a*(s-i) + b*i)/s;
  end
end


