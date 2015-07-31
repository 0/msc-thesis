settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(6));

import graph;


int P = 129;

for (int k = 0; k < P; ++k) {
	real omega = 10 * sin(0.5 * k * pi / P);

	draw((omega, 0) -- (omega, 1));
}

xaxis(Label("$\omega_k$", 0.5), axis=YEquals(-0.1), xmin=0, xmax=10, ticks=LeftTicks(Size=2));
