% expects 2x2 imagematrix b, results in a stretched stretchxstretch
% imagematrix with missing pixels bilinear interpolated
function bw = bilinear_4(b, stretch)
  bw = zeros(stretch);
  bw(1,1) = b(1,1);
  bw(1,end) = b(1,2);
  bw(end,1) = b(2,1);
  bw(end,end) = b(2,2);
  bw(:,1) = bilinear_2(bw(:,1), stretch);
  bw(:,end) = bilinear_2(bw(:,end), stretch);
  for i=1:stretch
    bw(i,:) = bilinear_2(bw(i,:), stretch);
  end
end
