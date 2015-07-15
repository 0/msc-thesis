settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(8));

from misc access draw_pigs_potential, draw_wavy_path, label_distance;

usepackage("braket");


int P = 7;

path A = nullpath;

for (int i = 0; i < P; ++i) {
	A = A -- (i, (1 - i % 2) / 2);
}

path B = shift(0.5, 1) * A;


for (int i = 0; i < P; ++i) {
	draw_pigs_potential(point(A, i), point(B, i), single=(i == 0 || i == P - 1));
}

draw_wavy_path(A, 0, 1);
draw_wavy_path(B);


label("$A$", shift(0.5, 0.0) * point(A, 1));
label("$B$", shift(0.2, 0.35) * point(B, 1));

label("$\ket{\psi_\mathrm{T}}$", shift(-0.4, 0) * point(A, 0));
label("$\ket{\psi_\mathrm{T}}$", shift(0.45, 0) * point(A, P - 1));
label("$\ket{\psi_\mathrm{T}}$", shift(-0.4, 0) * point(B, 0));
label("$\ket{\psi_\mathrm{T}}$", shift(0.4, 0) * point(B, P - 1));


label_distance(point(B, 3), point(B, 2), "$\tau$");
