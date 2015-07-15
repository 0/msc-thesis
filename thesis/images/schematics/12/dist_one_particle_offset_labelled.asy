settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

from misc access label_distance;
import misc_path_short;


pair[][] springs = {
	{(0, 0), (1, -1)},
};

pair[][] potentials = {
};

pair[][] potentials_central = {
	{(0, 0), (1, 0)},
	{(1, -1), (1, 0)},
};

draw_symbol(springs, potentials, potentials_central=potentials_central, extend=true, num_paths=1);

pair a = scale_coord((1, 0));
pair b = scale_coord((1, -1));

draw(b, marker=MarkFill[0]);
label_distance(a, b, "$\delta q$", bars=false, rotate=false);
