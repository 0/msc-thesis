#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import HISTOGRAM_COLOR



name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))


plt.fill_between(data[:, 0], data[:, 1], 0., linewidth=0.5, facecolor=HISTOGRAM_COLOR)

ax = plt.gca()
ax.set_yscale('log')

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Distribution of traces for primitive estimator')
plt.xlabel(r'$\Tr{\hat{\rho}_A^2}$')
plt.ylabel(r'Density')

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
