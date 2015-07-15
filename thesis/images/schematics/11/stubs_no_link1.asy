settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path_short;


pair[][] springs = {
};

pair[][] potentials = {
};

draw_symbol(springs, potentials, extend=true, num_paths=2);
