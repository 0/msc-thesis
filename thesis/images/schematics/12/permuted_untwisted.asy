settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path;


path_y_scaling *= 0.75;


real perspective_offset = 0.4;


int idx_end = path_potential_xs.length;
int idx_mid = floor(idx_end / 2);

for (int i = 0; i < idx_mid; ++i) {
	draw_pigs_potential((path_potential_xs[i] + perspective_offset, path_y_pos(0)), (path_potential_xs[i], path_y_pos(1)), single=(i == 0), style=shortdashed);
	draw_pigs_potential((path_potential_xs[i] + perspective_offset, path_y_pos(2)), (path_potential_xs[i], path_y_pos(3)), single=(i == 0), style=shortdashed);
}

draw_pigs_potential((path_potential_xs[idx_mid] + perspective_offset, path_y_pos(0)), (path_potential_xs[idx_mid], path_y_pos(1)), single=true, style=shortdashed);
draw_pigs_potential((path_potential_xs[idx_mid] + perspective_offset, path_y_pos(0)), (path_potential_xs[idx_mid] + perspective_offset, path_y_pos(2)), single=true, style=shortdashed);
draw_pigs_potential((path_potential_xs[idx_mid], path_y_pos(1)), (path_potential_xs[idx_mid], path_y_pos(3)), single=true, style=shortdashed);
draw_pigs_potential((path_potential_xs[idx_mid] + perspective_offset, path_y_pos(2)), (path_potential_xs[idx_mid], path_y_pos(3)), single=true, style=shortdashed);

for (int i = idx_mid + 1; i < idx_end - 1; ++i) {
	draw_pigs_potential((path_potential_xs[i], path_y_pos(1)), (path_potential_xs[i], path_y_pos(3)), style=shortdashed);
	draw_pigs_potential((path_potential_xs[i] + perspective_offset, path_y_pos(0)), (path_potential_xs[i] + perspective_offset, path_y_pos(2)), style=shortdashed);
}

draw_pigs_potential((path_potential_xs[idx_end - 1], path_y_pos(1)), (path_potential_xs[idx_end - 1], path_y_pos(3)), single=true, style=shortdashed);

// Leave gap for label.
real avg = (path_y_pos(0) + path_y_pos(2)) / 2;
draw_pigs_potential((path_potential_xs[idx_end - 1] + perspective_offset, path_y_pos(0)), (path_potential_xs[idx_end - 1] + perspective_offset, avg + 0.1), single=true, style=shortdashed);
draw_pigs_potential((path_potential_xs[idx_end - 1] + perspective_offset, avg - 0.08), (path_potential_xs[idx_end - 1] + perspective_offset, path_y_pos(2)), single=true, style=shortdashed);


draw_detailed_path(3, 3);
draw_detailed_path(1, 1);

for (int i = 0; i < path_x_poss.length; ++i) {
	path_x_poss[i] += perspective_offset;
}

draw_detailed_path(2, 2);
draw_detailed_path(0, 0);


draw_path_label(1, "$A^{[\lambda]}$");
draw_path_label(3, "$B^{[\mu]}$");

label_x_offset += perspective_offset;

draw_path_label(0, "$B^{[\lambda]}$");
draw_path_label(2, "$A^{[\mu]}$");

label_x_offset += 7.7 - perspective_offset;

draw_path_label(1, "$A^{[\mu]}$");
draw_path_label(3, "$B^{[\mu]}$");

label_x_offset += perspective_offset;

draw_path_label(0, "$B^{[\lambda]}$");
draw_path_label(2, "$A^{[\lambda]}$");
