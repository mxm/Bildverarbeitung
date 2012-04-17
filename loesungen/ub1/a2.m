source ub1.m;
echo on all
b3 = [0, 204, 102, 204; 204, 255, 51, 51; 204, 102, 153, 51; 153, 51, 51, 0]
nb3 = normalizeAuto(b3)
hb3 = h4 * nb3
hb3h = hb3 * h4
hhb3h = h4 * hb3h
hhb3hh = hhb3h * h4
denormalize(hhb3hh, 255)
