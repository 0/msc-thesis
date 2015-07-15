settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path_short;


pair[][] springs = {
	{(0, 0), (1, 0)},
};

pair[][] potentials = {
};

pair[][] potentials_central = {
	{(1, 0), (1, 0)},
};

draw_symbol(springs, potentials, potentials_central=potentials_central, num_paths=1);
