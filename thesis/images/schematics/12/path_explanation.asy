settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path;


draw_detailed_path(0, 0, 1, 1, pot=true);
draw_detailed_path(1, 1, 0, 0);
draw_detailed_path(2, 2, 3, 3, pot=true);
draw_detailed_path(3, 3, 2, 2);


string[] path_labels = {"$B^{[\lambda]}$", "$A^{[\lambda]}$", "$A^{[\mu]}$", "$B^{[\mu]}$"};

draw_path_labels(path_labels);
draw_bead_labels();

draw_box(4, 5);
