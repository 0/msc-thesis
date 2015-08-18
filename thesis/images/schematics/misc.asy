real bar_width = 3;
real shift_scaling = 0.08;

pen finedashed = linetype(new real[] {2, 2});
pen shortdashed = linetype(new real[] {4, 4});

pen blue = cmyk(1.0, 0.8, 0.0, 0.0);
pen red = cmyk(0.0, 1.0, 1.0, 0.2);


bool isin(int[] a, int key) {
	for (int i = 0; i < a.length; ++i) {
		if (a[i] == key) {
			return true;
		}
	}

	return false;
}


path _show_distance_path(pair A, pair B, bool bars=true) {
	path P = A .. B;

	if (bars) {
		// Move the path so that the bars are aligned with the points.
		real angle = degrees(A - B);

		return shift(shift_scaling * dir(90 + angle)) * P;
	} else {
		return P;
	}
}

guide _wavy(pair A, pair B, int steps_offset=0, int dir_offset=0) {
	real len = length(B - A);
	int num_steps = floor(len / 0.1) + steps_offset;
	pair step = (B - A) / num_steps;

	real x = 40;
	pair[] perp_dirs = {dir(degrees(B - A) + x), dir(degrees(B - A) - x)};

	guide w = nullpath;

	for (int i = 0; i <= num_steps; ++i) {
		w = w ..{perp_dirs[(i + dir_offset) % 2]} A + i * step;
	}

	return w;
}

void draw_wavy_path(path P, int steps_offset=0, int dir_offset=0, bool show_marks=true) {
	for (int i = 0; i < length(P); ++i) {
		draw(_wavy(point(P, i), point(P, i + 1), steps_offset, dir_offset), blue);
	}

	if (show_marks) {
		draw(P, invisible, marker=MarkFill[0]);
	}
}

void draw_pigs_potential(pair A, pair B, bool single=false, pen style=dashed, string only='none') {
	pair mid = midpoint(A -- B);
	real bulge = 0.1;

	pen style = style+linewidth(0.3)+red;

	if (single) {
		draw(A .. mid .. B, style);
	} else {
		if (only == 'none' || only == 'left') {
			draw(A .. shift(-bulge, 0) * mid .. B, style);
		}

		if (only == 'none' || only == 'right') {
			draw(A .. shift( bulge, 0) * mid .. B, style);
		}
	}
}

void draw_pigs_potential_central(pair A, pair B, bool single=false, pen style=dashed, string only='none') {
	pair mid = midpoint(A -- B);
	real bulge = 0.1;

	pen style = style+linewidth(0.3)+red;

	if (single) {
		draw(A .. mid, style);
	} else {
		if (only == 'none' || only == 'left') {
			draw(A .. shift(-bulge, 0) * mid, style);
		}

		if (only == 'none' || only == 'right') {
			draw(A .. shift( bulge, 0) * mid, style);
		}
	}
}

void label_distance(pair A, pair B, string L, bool bars=true, bool rotate=false) {
	path LD = _show_distance_path(A, B, bars=bars);
	Label L2;

	if (rotate) {
		L2 = rotate(degrees(A - B)) * L;
	} else {
		L2 = L;
	}

	if (bars) {
		draw(LD, arrow=Arrows(size=bar_width), bar=Bars(bar_width));
	} else {
		draw(LD, arrow=Arrows(size=bar_width));
	}
	label(L2, LD);
}

void label_angle(pair A, pair B, pair C, real R, string L, pair L_offset=(0, 0)) {
	path circ = circle(B, R);
	real circ_start = arctime(circ, arclength(circ) * angle(A - B) / (2 * pi));
	real circ_end = arctime(circ, arclength(circ) * angle(C - B) / (2 * pi));
	path mark = subpath(circ, circ_start, circ_end);

	draw(mark);
	label(L, midpoint(mark) + L_offset);
}
