settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path;


draw_detailed_path(0, 0, 1, 2, pot=true);
draw_detailed_path(3, 3, 2, 1, pot=true, pot_mid_swap=true);
draw_detailed_path(1, 2);
draw_detailed_path(2, 1);


string[] path_labels = {"$B^{[\lambda]}$", "$A^{[\lambda]}$", "$A^{[\mu]}$", "$B^{[\mu]}$"};

draw_path_labels(path_labels);

label_x_offset += 7.7;

draw_path_labels(path_labels);
