settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

from misc access label_angle, shortdashed;
import misc_radial;


pair O = (0, 0);
real R = 1;
real arrow_len = 1.5 * R;
real arrow_diag = arrow_len / sqrt(2);
real arrow_back_len = 1.1 * R;
real arrow_back_diag = arrow_back_len / sqrt(2);

path horiz = ellipse(O, R, 0.6 * R);

path vec_q2 = O -- O + (0, -0.84 * R);
path vec_r = point(vec_q2, 1) -- O + (0.7 * R, 0.55 * R);


draw(O -- O + (arrow_back_diag, arrow_back_diag), arrow_style + shortdashed);

draw(subpath(horiz, 0, length(horiz) / 2), shortdashed);

draw(O -- O + (0, arrow_len), arrow_style, arrow=head);
draw(O -- O + (0, -arrow_back_len), arrow_style + shortdashed);
label("$z$", O + (0, arrow_len), align=N);
draw(O -- O + (arrow_len, 0), arrow_style, arrow=head);
draw(O -- O + (-arrow_back_len, 0), arrow_style + shortdashed);
label("$y$", O + (arrow_len, 0), align=E);

draw(circle(O, R));

draw(O -- O + (-arrow_diag, -arrow_diag), arrow_style, arrow=head);
label("$x$", O + (-arrow_diag, -arrow_diag), align=SW);

label_angle(point(vec_q2, 0), point(vec_r, 0), point(vec_r, 1), 0.5 * R, "$\theta_r$", L_offset=(0.04, 0.13));
draw(vec_q2, vec_style, arrow=head);
label("$\mathbf{q}_2$", point(vec_q2, 1), align=NW);
draw(vec_r, vec_style, arrow=head);
label("$\mathbf{r}$", midpoint(vec_r), align=SE);

draw(subpath(horiz, length(horiz) / 2, length(horiz)));

draw(O, marker=MarkFill[0]);
