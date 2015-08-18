#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


OMEGA = 0.0654602  # 1 / ps


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
gammas = [
        '0.0001',
        '0.001',
        '0.001131',
        '0.01',
        '0.1',
        ]  # 1/nm^2
ts = data[:, 0]


_, axes = plt.subplots(2, sharex=True)


ts_exact = np.linspace(0., ts.max(), 500)
axes[0].plot(ts_exact, np.cos(OMEGA * ts_exact), linestyle='dashed', linewidth=2, color='black')
axes[1].plot(ts_exact, -np.sin(OMEGA * ts_exact), linestyle='dashed', linewidth=2, color='black')

for i, gamma in enumerate(gammas):
    axes[0].plot(ts, data[:, 1 + 2 * i],
                 color=COLORS[i],
                 label=r'$\gamma = \SI{' + gamma +  r'}{\per\square\nano\meter}$')
    axes[1].plot(ts, data[:, 2 + 2 * i],
                 color=COLORS[i],
                 label=r'$\gamma = \SI{' + gamma +  r'}{\per\square\nano\meter}$')

fig = plt.gcf()
fig.set_size_inches(10, 12)

axes[0].set_title(r'Harmonic oscillator ground state survival amplitude')
axes[1].set_xlabel(r'$t / \si{\pico\second}$')
axes[0].set_ylabel(r'$\Re{(S_{0,t}^\mathrm{HK})}$')
axes[1].set_ylabel(r'$\Im{(S_{0,t}^\mathrm{HK})}$')

for axis in axes:
    axis.set_ylim(-1.1, 1.1)

axes[0].legend(loc=3)
axes[1].legend(loc=2)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
