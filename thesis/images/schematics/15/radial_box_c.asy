settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

from misc access shortdashed;
import misc_radial;


pair O = (0, 0);
real R = 1.5;

real inter = R * sin(acos(sqrt(2) * M / R));


draw_axes(O, 1.9);
draw_cube(O, top, right, front, shortdashed, on=cube_rear);
draw_cube(O, top, right, front, shortdashed, on=cube_rim);

draw(shift(O) * shift(top) * shift(right) * ((0, 0) -- inter * front), cube_style + shortdashed);
draw(shift(O) * shift(top) * shift(front) * ((0, 0) -- inter * right), cube_style + shortdashed);
draw(shift(O) * shift(right) * shift(top) * ((0, 0) -- inter * front), cube_style + shortdashed);
draw(shift(O) * shift(right) * shift(front) * ((0, 0) -- inter * top), cube_style + shortdashed);
draw(shift(O) * shift(front) * shift(top) * ((0, 0) -- inter * right), cube_style + shortdashed);
draw(shift(O) * shift(front) * shift(right) * ((0, 0) -- inter * top), cube_style + shortdashed);

draw(shift(O) * wedge(top, right, front, R), sphere_style);

path trunc = slice((inter - M) * top, (inter - M) * right) & slice((inter - M) * right, (inter - M) * front) & slice((inter - M) * front, (inter - M) * top) & cycle;
filldraw(shift(O) * shift(pt) * trunc, sphere_fill_style, sphere_style);

draw(shift(O) * shift(top) * shift(right) * (inter * front -- front), cube_style);
draw(shift(O) * shift(top) * shift(front) * (inter * right -- right), cube_style);
draw(shift(O) * shift(right) * shift(top) * (inter * front -- front), cube_style);
draw(shift(O) * shift(right) * shift(front) * (inter * top -- top), cube_style);
draw(shift(O) * shift(front) * shift(top) * (inter * right -- right), cube_style);
draw(shift(O) * shift(front) * shift(right) * (inter * top -- top), cube_style);
