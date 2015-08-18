#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
gammas = [
        '0.0001',
        '0.001',
        '0.001131',
        '0.01',
        '0.1',
        ]  # 1/nm^2
const_dq = 2.  # nm


plt.axhline(1., linestyle='dashed', color='black')
plt.axvline(const_dq, linestyle='dotted', color='black')

for i, gamma in enumerate(gammas):
    d = data[data[:, 0] == float(gamma)]

    plt.plot(d[:, 1], d[:, 2],
             color=COLORS[i],
             label=r'$\gamma = \SI{' + gamma +  r'}{\per\square\nano\meter}$')

ax = plt.gca()
ax.set_xscale('log')

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Convergence of $t = 0$ survival amplitude')
plt.xlabel(r'$\Delta q^\star / \si{\nano\meter}$')
plt.ylabel(r'$\Re{(S_{0,t=0}^\mathrm{HK})}$')

plt.ylim(0.4, 1.4)

plt.legend(loc=4)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
