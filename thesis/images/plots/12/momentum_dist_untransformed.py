#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, gaussian


VAR = 1769  # nm^2


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
qs = np.linspace(data[0, 0], data[-1, 0], 1000)


plt.plot(qs, gaussian(VAR, qs, norm=1.), linestyle='dashed', linewidth=2, color='black')
plt.plot(data[:, 0], data[:, 1], color=COLORS[0])

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Raw estimator for momentum distribution of harmonic oscillator')
plt.xlabel(r'$\delta q / \si{\nano\meter}$')
plt.ylabel(r'$\rho(\delta q)$')

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
