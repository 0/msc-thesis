#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, EPS, EXACT_TRACES, entropize, entropize_err


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
data_num = np.loadtxt('{}.num'.format(name))
const_tau = 0.05  # 1/K


values = data[:, 1]
errs = data[:, 2]
nums = data_num
nums = nums[nums[:, 0] >= 0.02]
nums = nums[nums[:, 0] <= 0.12]

plt.axhline(entropize(EXACT_TRACES[3]), linestyle='dashed', color='black')
plt.plot(nums[:, 0], entropize(nums[:, 1]), linestyle='dotted', color='black')

plt.errorbar(data[:, 0], entropize(values),
             yerr=entropize_err(values, errs),
             color=COLORS[0])

const_value = values[np.argwhere(np.fabs(data[:, 0] - const_tau) < EPS)]
plt.plot(const_tau, entropize(const_value), marker='x', color='black')

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Convergence of entropy using minimal estimator')
plt.xlabel(r'$\tau / \si{\per\kelvin}$')
plt.ylabel(r'$S_2$')

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
