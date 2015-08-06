#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORMAP_PHASE


name = splitext(basename(argv[0]))[0]

data_raw = np.loadtxt('{}.data'.format(name))

data = np.split(data_raw, 6)


_, axes = plt.subplots(3, 2, sharex=True, sharey=True)

for a, d in zip(axes.flatten(), data):
    a.imshow(d, interpolation='none', extent=(0, 2, 0, 2), cmap=COLORMAP_PHASE, vmin=0, vmax=2. * np.pi)
    a.set_xticklabels([])
    a.set_yticklabels([])

fig = plt.gcf()
fig.set_size_inches(10, 15)

for i in [0, 1]:
    axes[2][i].set_xlabel(r"$q_k$")

for i in [0, 1, 2]:
    axes[i][0].set_ylabel(r"$p_i$")

axes[0][0].set_title(r'$t = \SI{0}{\pico\second}$')
axes[0][1].set_title(r'$t = \SI{2}{\pico\second}$')
axes[1][0].set_title(r'$t = \SI{4}{\pico\second}$')
axes[1][1].set_title(r'$t = \SI{10}{\pico\second}$')
axes[2][0].set_title(r'$t = \SI{20}{\pico\second}$')
axes[2][1].set_title(r'$t = \SI{40}{\pico\second}$')

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
