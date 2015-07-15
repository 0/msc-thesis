settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path_short;


pair[][] springs = {
	{(0, 1), (1, 1)},
	{(0, 2), (1, 2)},
};

pair[][] potentials = {
	{(1, 0), (1, 1), (1, 0)},
	{(1, 2), (1, 3), (1, 0)},
};

draw_symbol(springs, potentials);
