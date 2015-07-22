settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path;


draw_detailed_path(0, 0, 1, 1, pot=true, central_dir=1);
draw_detailed_path(1, 1, 0, 0, central_dir=-1);


string[] path_labels = {"$A$", "$B$"};

draw_path_labels(path_labels);
draw_bead_labels();
