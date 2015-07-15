#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


OMEGA = 0.0654602  # 1 / ps


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
ts = data[:, 0]


_, axes = plt.subplots(2, sharex=True)


ts_exact = np.linspace(0., ts.max(), 500)
axes[0].plot(ts_exact, np.cos(OMEGA * ts_exact), linestyle='dashed', linewidth=2, color='black')
axes[1].plot(ts_exact, -np.sin(OMEGA * ts_exact), linestyle='dashed', linewidth=2, color='black')

axes[0].errorbar(ts, data[:, 1], yerr=data[:, 2], color=COLORS[0])
axes[1].errorbar(ts, data[:, 3], yerr=data[:, 4], color=COLORS[0])

fig = plt.gcf()
fig.set_size_inches(10, 12)

axes[0].set_title(r'Harmonic oscillator ground state survival amplitude')
axes[1].set_xlabel(r'$t / \si{\pico\second}$')
axes[0].set_ylabel(r'$\Re{(S_0^\mathrm{HK,G}(t))}$')
axes[1].set_ylabel(r'$\Im{(S_0^\mathrm{HK,G}(t))}$')

for axis in axes:
    axis.set_ylim(-1.1, 1.1)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
