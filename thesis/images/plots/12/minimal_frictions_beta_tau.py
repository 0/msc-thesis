#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
beta_Ps = [
        (4., 17),
        (8., 33),
        (12., 49),
        (4., 33),
        (8., 65),
        (12., 97),
        ]


for i, (beta, P) in enumerate(beta_Ps):
    plt.plot(data[:, 0], data[:, 1+i], color=COLORS[i], label=r'$\beta = \SI{' + str(beta) + r'}{\per\kelvin}, \ell = ' + str(P-1) + r'$')

ax = plt.gca()
ax.set_xscale('symlog', linthreshx=1e-6)

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Error minimization for minimal estimator')
plt.xlabel(r'$\gamma^{(0)} / \si{\per\pico\second}$')
plt.ylabel(r'Standard error of trace')

plt.legend(loc=2)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
