#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, gaussian


VAR = 2.281e-6  # g^2 nm^2/ps^2 mol^2


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
ps = np.linspace(data[0, 0], data[-1, 0], 1000)


plt.plot(ps, gaussian(VAR, ps), linestyle='dashed', linewidth=2, color='black')
plt.plot(data[:, 0], data[:, 1], color=COLORS[0])

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Momentum distribution of harmonic oscillator')
plt.xlabel(r'$p / \si{\gram\nano\meter\per\pico\second\per\mole}$')
plt.ylabel(r'$\rho(p) / \si{\pico\second\mole\per\gram\per\nano\meter}$')

plt.ylim(0.0, plt.ylim()[1])

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
