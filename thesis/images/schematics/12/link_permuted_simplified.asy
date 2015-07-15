settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path_short;


pair[][] springs = {
	{(0, 1), (1, 2)},
	{(0, 2), (1, 1)},
};

pair[][] potentials = {
	{(1, 0), (1, 2), (0, 2)},
	{(1, 1), (1, 3), (0, 1)},
};

draw_symbol(springs, potentials);
