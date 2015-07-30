settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

from misc access shortdashed;
import misc_radial;


pair O = (0, 0);
real R = 0.8;


draw_axes(O, 1.9);
draw_cube(O, top, right, front, cube_style + shortdashed, on=cube_rear);
filldraw(shift(O) * wedge(top, right, front, R), sphere_fill_style, sphere_style);
draw_cube(O, top, right, front, cube_style, on=cube_rim);
draw_cube(O, top, right, front, cube_style, on=cube_front);
