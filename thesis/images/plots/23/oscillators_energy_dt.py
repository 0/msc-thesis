#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, EPS, EXACT_ENERGIES


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
omega_ratios = [0, 1, 2, 4, 8]
const_dts = [0.5, 0.5, 0.25, 0.2, 0.1]  # ps


for i, omega_ratio in enumerate(omega_ratios):
    values = data[:, 1 + 2 * i]
    errs = data[:, 1 + 2 * i + 1]

    plt.axhline(EXACT_ENERGIES[i], linestyle='dashed', color='black')

    plt.errorbar(data[:, 0], values,
                 yerr=errs,
                 color=COLORS[i],
                 label=r'$\omega_\mathrm{int} / \omega_0 = ' + str(omega_ratio) +  r'$')

    const_value = values[np.argwhere(np.fabs(data[:, 0] - const_dts[i]) < EPS)]
    plt.plot(const_dts[i], const_value, marker='x', color='black')

ax = plt.gca()
ax.set_xscale('log')

fig = plt.gcf()
fig.set_size_inches(10, 3)

plt.title(r'Convergence of energy')
plt.xlabel(r'$\Delta t / \si{\pico\second}$')
plt.ylabel(r'$E_0 / \si{\kelvin}$')

plt.legend(prop={'size': 6})

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
