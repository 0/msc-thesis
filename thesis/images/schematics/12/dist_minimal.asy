settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import misc_path_short;


pair[][] springs = {
	{(0, 0), (1, 0)},
	{(0, 3), (1, 3)},
};

pair[][] potentials = {
	{(0, 0), (0, 1), (1, 0)},
	{(0, 2), (0, 3), (1, 0)},
};

draw_symbol(springs, potentials, extend=true);
