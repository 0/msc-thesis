#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, EPS, EXACT_ENERGIES


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
data_num = np.loadtxt('{}.num'.format(name))
omega_ratios = [0, 1, 2, 4, 8]
const_betas = [3., 3.5, 4., 4.5, 5.]  # 1/K


for i, omega_ratio in enumerate(omega_ratios):
    values = data[:, 1 + 2 * i]
    errs = data[:, 1 + 2 * i + 1]
    nums = data_num[data_num[:, 0] == omega_ratio]

    plt.axhline(EXACT_ENERGIES[i], linestyle='dashed', color='black')
    plt.plot(nums[:, 1], nums[:, 2], linestyle='dotted', color='black')

    plt.errorbar(data[:, 0], values,
                 yerr=errs,
                 color=COLORS[i],
                 label=r'$\omega_\mathrm{int} / \omega_0 = ' + str(omega_ratio) +  r'$')

    const_value = values[np.argwhere(np.fabs(data[:, 0] - const_betas[i]) < EPS)]
    plt.plot(const_betas[i], const_value, marker='x', color='black')

fig = plt.gcf()
fig.set_size_inches(10, 3)

plt.title(r'Convergence of energy')
plt.xlabel(r'$\beta / \si{\per\kelvin}$')
plt.ylabel(r'$E_0 / \si{\kelvin}$')

plt.legend(prop={'size': 6}, loc=2)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
