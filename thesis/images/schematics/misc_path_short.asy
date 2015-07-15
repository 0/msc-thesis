from misc access _wavy, blue, draw_pigs_potential, draw_pigs_potential_central, shortdashed;


pair scale_coord(pair x) {
	return (0.55 * xpart(x), -0.3 * ypart(x));
}

// The list of springs has lists of start and end coordinates for each of the
// springs. The list of potentials is more complicated, with the first two
// pairs representing coordinates, while the last pair relays the extra
// arguments to the drawing function.
void draw_symbol(pair[][] springs, pair[][] potentials, pair[][] potentials_central={}, bool extend=false, int num_paths=4, int links_wide=1) {
	for (pair[] potential : potentials) {
		pair start = scale_coord(potential[0]);
		pair end = scale_coord(potential[1]);
		real _single = xpart(potential[2]);
		real _only = ypart(potential[2]);

		bool single = _single == 1;

		string only;
		if (_only == 1) {
			only = 'left';
		} else if (_only == 2) {
			only = 'right';
		} else {
			only = 'none';
		}

		draw_pigs_potential(start, end, single=single, style=shortdashed, only=only);
	}

	for (pair[] potential : potentials_central) {
		pair start = scale_coord(potential[0]);
		pair end = (xpart(start), ypart(start) + 0.3);
		real _single = xpart(potential[1]);
		real _only = ypart(potential[1]);

		bool single = _single == 1;

		string only;
		if (_only == 1) {
			only = 'left';
		} else if (_only == 2) {
			only = 'right';
		} else {
			only = 'none';
		}

		draw_pigs_potential_central(start, end, single=single, style=shortdashed, only=only);
	}

	for (pair[] spring : springs) {
		pair start = scale_coord(spring[0]);
		pair end = scale_coord(spring[1]);
		int dir_offset = 0;

		if (spring[0].x % 2 == 1) {
			dir_offset = 1;
		}

		draw(_wavy(start, end, dir_offset=dir_offset), blue);
	}

	for (int i = 0; i < num_paths; ++i) {
		for (int j = 0; j < links_wide; ++j) {
			draw(scale_coord((j, i)) -- scale_coord((j + 1, i)), invisible, marker=MarkFill[0]);
		}
	}

	pen extend_style;
	if (extend) {
		extend_style = linewidth(0.3);
	} else {
		// Keep the image width the same.
		extend_style = invisible;
	}

	real extend_len = 0.3;

	for (int i = 0; i < num_paths; ++i) {
		draw(scale_coord((0, i)) -- scale_coord((-extend_len, i)), extend_style);
		draw(scale_coord((links_wide, i)) -- scale_coord((links_wide + extend_len, i)), extend_style);
	}
}
