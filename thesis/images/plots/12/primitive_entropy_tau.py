#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, EPS, EXACT_TRACES, entropize, entropize_err


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
data_num = np.loadtxt('{}.num'.format(name))
omega_ratios = [0, 1, 2, 4, 8]
const_taus = [0.25, 0.125, 0.1, 0.05, 0.025]  # 1/K


for i, omega_ratio in enumerate(omega_ratios):
    values = data[:, 1 + 2 * i]
    errs = data[:, 1 + 2 * i + 1]
    nums = data_num[data_num[:, 0] == omega_ratio]

    plt.axhline(entropize(EXACT_TRACES[i]), linestyle='dashed', color='black')
    plt.plot(nums[:, 1], entropize(nums[:, 2]), linestyle='dotted', color='black')

    plt.errorbar(data[:, 0], entropize(values),
                 yerr=entropize_err(values, errs),
                 color=COLORS[i],
                 label=r'$\omega_\mathrm{int} / \omega_0 = ' + str(omega_ratio) +  r'$')

    const_value = values[np.argwhere(np.fabs(data[:, 0] - const_taus[i]) < EPS)]
    plt.plot(const_taus[i], entropize(const_value), marker='x', color='black')

ax = plt.gca()
ax.set_xscale('log')

fig = plt.gcf()
fig.set_size_inches(10, 3)

plt.title(r'Convergence of entropy using primitive estimator')
plt.xlabel(r'$\tau / \si{\per\kelvin}$')
plt.ylabel(r'$S_2$')

plt.legend(prop={'size': 6})

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
