settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(8));

from misc access blue, red;


real side_length = 0.05;

path square(pair location) {
	pair p0 = shift(-side_length, -side_length) * location;
	pair p1 = shift(side_length, -side_length) * location;
	pair p2 = shift(side_length, side_length) * location;
	pair p3 = shift(-side_length, side_length) * location;

	return p0 -- p1 -- p2 -- p3 -- cycle;
}

path triangle(pair location) {
	pair p0 = shift(0, side_length * 2 / 3) * location;
	pair p1 = shift(-side_length, -side_length) * location;
	pair p2 = shift(side_length, -side_length) * location;

	return p0 -- p1 -- p2 -- cycle;
}


pair[] A = {
	(-0.74768172200020033, 0.41030719527509585),
	(-0.25072388559031844, 0.53605139060252394),
	(-0.030068698585640208, -0.55543887866951569),
	(0.21847844844409998, -0.1569806646913825),
	(0.68480211992415874, 0.28219324095746767),
	(0.76931720550560976, -0.63441923709540116),
	};
pair[] B = {
	(-0.87202985370474559, -0.47349709420754493),
	(-0.81543953169629613, -0.11843583167706706),
	(-0.37324502716480246, -0.27866124528458491),
	(-0.27180502443171339, -0.95686074543080135),
	(-0.067482613722878337, 0.29451353892118193),
	(0.19829274770347305, 0.33136059151207986),
	(0.21101619110257741, -0.74721370887340277),
	(0.71133174905886953, 0.60749349287252907),
	(0.73200242230115471, 0.13162172676641575),
	(0.93036122147779365, -0.89847843618685319),
	(0.97403753729519904, -0.63539115714628847),
	};


real partition_offset = 1.75;

// Unpartitioned.
transform unpartition_shift = shift((-partition_offset, 0));

for (pair a : A) {
	dot(unpartition_shift * a);
}

for (pair b : B) {
	dot(unpartition_shift * b);
}


draw((-0.5, -0.2) -- (0.5, -0.2), EndArrow);


// Partitioned.
transform partition_shift = shift((partition_offset, 0));

for (pair a : A) {
	filldraw(partition_shift * triangle(a), red, red);
}

for (pair b : B) {
	filldraw(partition_shift * square(b), blue, blue);
}

label("$A$", partition_shift * shift(-0.2, 0) * A[0], red);
label("$B$", partition_shift * shift(0.2, 0) * B[B.length - 1], blue);
