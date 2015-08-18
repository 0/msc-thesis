#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
omega_ratios = [0, 1, 2, 4, 8]


for i, omega_ratio in enumerate(omega_ratios):
    plt.plot(data[:, 0], data[:, 1+i], color=COLORS[i], label=r'$\omega_\mathrm{int} / \omega_0 = ' + str(omega_ratio) + r'$')

ax = plt.gca()
ax.set_xscale('symlog', linthreshx=1e-6)

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Error minimization for minimal estimator')
plt.xlabel(r'$\gamma^{(0)} / \si{\per\pico\second}$')
plt.ylabel(r'Standard error of trace')

plt.legend(loc=2)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
