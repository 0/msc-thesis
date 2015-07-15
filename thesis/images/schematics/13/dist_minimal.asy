settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path_short;


pair[][] springs = {
	{(1, 0), (2, 0)},
};

pair[][] potentials = {
};

pair[][] potentials_central = {
	{(0, 0), (1, 0)},
	{(2, 0), (1, 0)},
};

draw_symbol(springs, potentials, potentials_central=potentials_central, extend=true, num_paths=1, links_wide=2);
