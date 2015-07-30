settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

from misc access shortdashed;
import misc_radial;


pair O = (0, 0);
real R = 1.2;

real inter = R * cos(asin(M / R));


draw_axes(O, 1.9);
draw_cube(O, top, right, front, shortdashed, on=cube_rear);

draw(shift(O) * shift(top) * ((0, 0) -- inter * right), cube_style + shortdashed);
draw(shift(O) * shift(top) * ((0, 0) -- inter * front), cube_style + shortdashed);
draw(shift(O) * shift(right) * ((0, 0) -- inter * top), cube_style + shortdashed);
draw(shift(O) * shift(right) * ((0, 0) -- inter * front), cube_style + shortdashed);
draw(shift(O) * shift(front) * ((0, 0) -- inter * top), cube_style + shortdashed);
draw(shift(O) * shift(front) * ((0, 0) -- inter * right), cube_style + shortdashed);

path outside = shift(O) * wedge(top, right, front, R);
path[] slices = {
	shift(O) * shift(top) * slice(inter * front, inter * right),
	shift(O) * shift(right) * slice(inter * top, inter * front),
	shift(O) * shift(front) * slice(inter * right, inter * top),
};

real L = length(outside);
real x = 0.37;
real[] pts = {x, L/3 - x, L/3 + x, 2L/3 - x, 2L/3 + x, L - x};
path trunc = slices[0] & subpath(outside, pts[0], pts[1]) & slices[1] & subpath(outside, pts[2], pts[3]) & slices[2] & subpath(outside, pts[4], pts[5]) & cycle;

draw(subpath(outside, 0, pts[0]), sphere_style);
draw(subpath(outside, pts[1], pts[2]), sphere_style);
draw(subpath(outside, pts[3], pts[4]), sphere_style);
draw(subpath(outside, pts[5], L), sphere_style);
filldraw(trunc, sphere_fill_style, sphere_style);

draw(shift(O) * shift(top) * (inter * right -- right), cube_style);
draw(shift(O) * shift(top) * (inter * front -- front), cube_style);
draw(shift(O) * shift(right) * (inter * top -- top), cube_style);
draw(shift(O) * shift(right) * (inter * front -- front), cube_style);
draw(shift(O) * shift(front) * (inter * top -- top), cube_style);
draw(shift(O) * shift(front) * (inter * right -- right), cube_style);

draw_cube(O, top, right, front, defaultpen, on=cube_front);
