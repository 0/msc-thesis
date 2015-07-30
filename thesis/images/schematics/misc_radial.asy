from misc access blue, red, shortdashed;


arrowbar head = Arrow(HookHead);
pen arrow_style = blue;

real M = 1;
pair top = M * (0, 1);
pair right = M * (0.95, -0.2);
pair front = M * (-0.6, -0.6);
pair pt = top + right + front;
pen cube_style = defaultpen;

real bez = 0.5525;
pen sphere_style = red;
pen sphere_fill_style = red + opacity(0.7);

pen vec_style = red;


// Dummy.
void void() {}

void draw_axes(pair offset, real scale) {
	draw(shift(offset) * ((0, 0) -- scale * top), arrow_style, arrow=head);
	label("$z$", offset + scale * top, align=N);
	draw(shift(offset) * ((0, 0) -- scale * right), arrow_style, arrow=head);
	label("$y$", offset + scale * right, align=E);
	draw(shift(offset) * ((0, 0) -- scale * front), arrow_style, arrow=head);
	label("$x$", offset + scale * front, align=SW);
}

bool[][] cube_all = {{true, true, true, true}, {true, true, true, true}, {true, true, true, true}};
bool[][] cube_rear = {{true, false, false, false}, {true, false, false, false}, {true, false, false, false}};
bool[][] cube_rim = {{false, true, true, false}, {false, true, true, false}, {false, true, true, false}};
bool[][] cube_front = {{false, false, false, true}, {false, false, false, true}, {false, false, false, true}};

void draw_cube(pair O, pair top, pair right, pair front, pen style, bool[][] on=cube_all) {
	pair[] dirs = {top, right, front};

	for (int i = 0; i < 3; ++i) {
		path P = shift(O) * ((0, 0) -- dirs[i]);

		on [i][0] ? draw(P, shortdashed) : void();
		on [i][1] ? draw(shift(dirs[(i + 1) % 3]) * P, style) : void();
		on [i][2] ? draw(shift(dirs[(i + 2) % 3]) * P, style) : void();
		on [i][3] ? draw(shift(dirs[(i + 2) % 3]) * shift(dirs[(i + 1) % 3]) * P, style) : void();
	}
}

path slice(pair A, pair B) {
	return A .. controls A + bez * B and B + bez * A .. B;
}

path wedge(pair top, pair right, pair front, real R) {
	pair[] dirs = {top, right, front};
	guide result = nullpath;

	for (int i = 0; i < 3; ++i) {
		result = result & scale(R) * slice(dirs[i], dirs[(i + 1) % 3]);
	}

	return result & cycle;
}
