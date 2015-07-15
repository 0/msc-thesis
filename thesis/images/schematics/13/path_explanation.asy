settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path;


int[] central_at = {0, 1, 2, 4, 5, 6};
int[] single_at = {0, 2, 4, 6};

draw_central_potentials(0, -1, central_at, single_at);

draw_detailed_path(0, 0, 0, 0);


draw_bead_labels(left="$L$", center="$M$", right="$R$");
draw_box(4, 6, 1, extra_bottom=0.2);
