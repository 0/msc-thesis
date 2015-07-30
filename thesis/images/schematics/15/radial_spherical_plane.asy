settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

from misc access label_angle, label_distance, red;
import misc_radial;


pair O = (0, 0);
real R = 1;

path seg_r2 = O -- O + (0, -0.84 * R);
path seg_r = point(seg_r2, 1) -- O + (0.7 * R, 0.55 * R);


draw(circle(O, R));

label_angle(point(seg_r2, 0), point(seg_r, 0), point(seg_r, 1), 0.5 * R, "$\theta_r$", L_offset=(0.04, 0.13));
draw(seg_r2, vec_style);
label_distance(point(seg_r2, 0), point(seg_r2, 1), "$r_2$");
draw(seg_r, vec_style);
label_distance(point(seg_r, 0), point(seg_r, 1), "$r$");

draw(O, marker=MarkFill[0]);
