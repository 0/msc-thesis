settings.outformat = "pdf";
unitsize(1 cm);
defaultpen(fontsize(8));

from misc access draw_wavy_path, label_distance, red;


int P = 7;

path A = polygon(P);
path B = shift(1.3, 0.3) * A;


for (int i = 0; i < P; ++i) {
	draw(point(A, i) -- point(B, i), red+dashed+linewidth(0.3));
}

draw_wavy_path(A, 1, 1);
draw_wavy_path(B, 1, 1);


label("$A$", shift(-0.2, 0) * point(A, 5));
label("$B$", shift(0.2, 0) * point(B, 1));


label_distance(point(A, 3), point(A, 4), "$\tau$");
