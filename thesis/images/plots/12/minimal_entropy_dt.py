#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, EPS, EXACT_TRACES, entropize, entropize_err


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
omega_ratios = [0, 1, 2, 4, 8]
const_dts = [0.5, 0.5, 0.25, 0.2, 0.1]  # ps


for i, omega_ratio in enumerate(omega_ratios):
    values = data[:, 1 + 2 * i]
    errs = data[:, 1 + 2 * i + 1]

    plt.axhline(entropize(EXACT_TRACES[i]), linestyle='dashed', color='black')

    plt.errorbar(data[:, 0], entropize(values),
                 yerr=entropize_err(values, errs),
                 color=COLORS[i],
                 label=r'$\omega_\mathrm{int} / \omega_0 = ' + str(omega_ratio) +  r'$')

    const_value = values[np.argwhere(np.fabs(data[:, 0] - const_dts[i]) < EPS)]
    plt.plot(const_dts[i], entropize(const_value), marker='x', color='black')

ax = plt.gca()
ax.set_xscale('log')

fig = plt.gcf()
fig.set_size_inches(10, 3)

plt.title(r'Convergence of entropy using minimal estimator')
plt.xlabel(r'$\Delta t / \si{\pico\second}$')
plt.ylabel(r'$S_2$')

plt.legend()

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
