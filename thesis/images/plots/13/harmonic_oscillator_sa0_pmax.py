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
const_pmax = 1.


plt.axhline(1., linestyle='dashed', color='black')
plt.axvline(const_pmax, linestyle='dotted', color='black')

for i, gamma in enumerate(gammas):
    d = data[data[:, 0] == float(gamma)]

    plt.plot(d[:, 1], d[:, 2],
             color=COLORS[i],
             label=r'$\gamma = \SI{' + gamma +  r'}{\per\square\nano\meter}$')

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Divergence of $t = 0$ survival amplitude')
plt.xlabel(r"$p_\mathrm{max}' / p_\mathrm{max}$")
plt.ylabel(r'$\Re{(S_{0,t=0}^\mathrm{HK})}$')

plt.legend(loc=2)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
