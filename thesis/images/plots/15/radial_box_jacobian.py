#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]


def Xi(xs):
    A = np.arcsin(1. / np.sqrt(xs * xs - 1))
    B = np.arcsin(np.sqrt(xs * xs - 2) / np.sqrt(xs * xs - 1))
    C = xs * np.arctan(xs * np.sqrt(xs * xs - 2))

    return A - B + C

xs = [
        np.linspace(0, 1, 500),
        np.linspace(1, np.sqrt(2), 500),
        np.linspace(np.sqrt(2), np.sqrt(3), 500),
        ]
ys = [
        0.5 * np.pi * xs[0] * xs[0],
        0.5 * np.pi * xs[1] * (3. - 2. * xs[1]),
        0.5 * xs[2] * (6. * Xi(xs[2]) - 2. * np.pi * xs[2]),
        ]

plt.axvline(1., linestyle='dotted', color='black')
plt.axvline(np.sqrt(2), linestyle='dotted', color='black')
plt.axvline(np.sqrt(3), linestyle='dotted', color='black')

for x, y in zip(xs, ys):
    plt.plot(x, y, color=COLORS[0])

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Jacobian for integration in periodic boundary conditions')
plt.xlabel(r'$\xi$')
plt.ylabel(r'$J_\mathrm{d}(\xi)$')

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
