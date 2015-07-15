#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import HISTOGRAM_COLOR, gaussian


VAR = 442.1  # nm^2


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
qs = np.linspace(data[0, 0], data[-1, 0], 1000)


plt.plot(qs, gaussian(VAR, qs), linestyle='dashed', linewidth=2, color='black')
plt.fill_between(data[:, 0], data[:, 1], 0., facecolor=HISTOGRAM_COLOR)

fig = plt.gcf()
fig.set_size_inches(10, 3)

plt.title(r'Middle bead distribution of harmonic oscillator (fixed path)')
plt.xlabel(r'$q / \si{\nano\meter}$')
plt.ylabel(r'$\rho(q) / \si{\per\nano\meter}$')

plt.xlim(-100, 100)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
