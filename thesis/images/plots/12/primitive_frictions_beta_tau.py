#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
beta_Ps = [
        (4.5, 45),
        (9., 89),
        (4.5, 91),
        (9., 181),
        (4.5, 181),
        (9., 361),
        ]


for i, (beta, P) in enumerate(beta_Ps):
    plt.plot(data[:, 0], data[:, 1+i], color=COLORS[i], label=r'$\beta = \SI{' + str(beta) + r'}{\per\kelvin}, \ell = ' + str(P-1) + r'$')

ax = plt.gca()
ax.set_xscale('symlog', linthreshx=1e-6)

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Error minimization for primitive estimator')
plt.xlabel(r'$\gamma^{(0)} / \si{\per\pico\second}$')
plt.ylabel(r'Standard error of trace')

plt.ylim(0.0, 0.15)

plt.legend()

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
