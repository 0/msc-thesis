from misc access draw_pigs_potential, draw_pigs_potential_central, draw_wavy_path, finedashed, isin, shortdashed;


real path_y_scaling = -0.4;
real path_y_offset = -0.1;

real[] path_x_poss = {0, 1, 1.5, 2, 2.5, 3.5, 4.5, 5, 5.5, 6, 7};
real[] path_potential_xs = {0, 1, 2.5, 3.5, 4.5, 6, 7};

real path_y_pos(int idx) {
	return path_y_scaling * idx + path_y_offset;
}

real label_x_offset = -0.6;

real box_extra = 0.4;


void draw_central_potentials(int start_idx, int dir, int[] idxs, int[] single_at) {
	real start = path_y_pos(start_idx);

	real central_offset = 0.2 * dir;
	int idx_end = path_potential_xs.length;

	for (int i = 0; i < idxs.length; ++i) {
		bool single = isin(single_at, idxs[i]);

		draw_pigs_potential_central((path_potential_xs[idxs[i]], start), (path_potential_xs[idxs[i]], start + central_offset), single=single, style=shortdashed);
	}
}

void draw_detailed_path(int start_idx, int end_idx, int other_idx=-1, int other_mid_idx=-1, bool pot=false, bool pot_mid_swap=false, bool mid_link=true, bool mid_pot=true, int central_dir=0) {
	real start = path_y_pos(start_idx);
	real end = path_y_pos(end_idx);

	real other, other_mid;
	if (other_idx >= 0 && other_mid_idx >= 0) {
		other = path_y_pos(other_idx);
		other_mid = path_y_pos(other_mid_idx);
	}

	string pot_first = pot_mid_swap ? 'left' : 'right';
	string pot_second = pot_mid_swap ? 'right' : 'left';

	if (pot) {
		int idx_end = path_potential_xs.length;
		int idx_mid = floor(idx_end / 2);

		for (int i = 0; i < idx_end; ++i) {
			bool single = i == 0 || i == idx_end - 1 || (!mid_pot && (i == idx_mid || i == idx_mid - 1));

			if (i == idx_mid) {
				draw_pigs_potential((path_potential_xs[i], start), (path_potential_xs[i], other_mid), single=single, style=shortdashed, only=pot_first);
				draw_pigs_potential((path_potential_xs[i], start), (path_potential_xs[i], other), single=single, style=shortdashed, only=pot_second);
			} else {
				draw_pigs_potential((path_potential_xs[i], start), (path_potential_xs[i], other), single=single, style=shortdashed);
			}
		}
	}

	if (central_dir != 0) {
		int[] single_at = {0, path_potential_xs.length - 1};

		draw_central_potentials(start_idx, central_dir, sequence(path_potential_xs.length), single_at);
	}

	draw_wavy_path((path_x_poss[0], start) -- (path_x_poss[1], start));
	draw_wavy_path((path_x_poss[1], start) -- (path_x_poss[2], start), show_marks=false);
	draw((path_x_poss[2], start) -- (path_x_poss[3], start), dotted);
	draw_wavy_path((path_x_poss[3], start) -- (path_x_poss[4], start), 1, show_marks=false);
	if (mid_link) {
		draw_wavy_path((path_x_poss[4], start) -- (path_x_poss[5], end));
	}
	draw_wavy_path((path_x_poss[5], end) -- (path_x_poss[6], end));
	draw_wavy_path((path_x_poss[6], end) -- (path_x_poss[7], end), show_marks=false);
	draw((path_x_poss[7], end) -- (path_x_poss[8], end), dotted);
	draw_wavy_path((path_x_poss[8], end) -- (path_x_poss[9], end), 1, show_marks=false);
	draw_wavy_path((path_x_poss[9], end) -- (path_x_poss[10], end));

	path P = (path_x_poss[0], start) -- (path_x_poss[1], start) -- (path_x_poss[4], start) -- (path_x_poss[5], end) -- (path_x_poss[6], end) -- (path_x_poss[9], end) -- (path_x_poss[10], end);

	draw(P, invisible, marker=MarkFill[0]);
}


void draw_path_label(int idx, string L) {
	label(L, (label_x_offset, path_y_pos(idx) - 0.1), Align);
}

void draw_path_labels(string[] Ls) {
	for (int i = 0; i < Ls.length; ++i) {
		draw_path_label(i, Ls[i]);
	}
}

void draw_bead_labels(real label_y_offset=0.1, string left="$M - 1$", string center="$M\vphantom{+}$", string right="$M + 1$") {
	// Phantom bits are for vertical alignment.
	label("$0$", (path_x_poss[0], label_y_offset));
	label("$1$", (path_x_poss[1], label_y_offset));
	label(left, (path_x_poss[4], label_y_offset));
	label(center, (path_x_poss[5], label_y_offset));
	label(right, (path_x_poss[6], label_y_offset));
	label("$P - 2$", (path_x_poss[9], label_y_offset));
	label("$P - 1$", (path_x_poss[10], label_y_offset));
}

void draw_box(int idx_start, int idx_end, int num_paths=4, real extra_bottom=0.15) {
	real y_pos_over = 0.25;
	real y_pos_under = path_y_pos(num_paths - 1) - extra_bottom;

	pair p1 = (path_x_poss[idx_start] - box_extra, y_pos_over);
	pair p2 = (path_x_poss[idx_end] + box_extra, y_pos_over);
	pair p3 = (path_x_poss[idx_end] + box_extra, y_pos_under);
	pair p4 = (path_x_poss[idx_start] - box_extra, y_pos_under);

	draw(p1 -- p2 -- p3 -- p4 -- cycle, finedashed);
}
