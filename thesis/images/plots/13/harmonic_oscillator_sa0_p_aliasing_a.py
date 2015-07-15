#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORMAP


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))


plt.imshow(data, interpolation='none', extent=(0, 2, -1, 1), cmap=COLORMAP)

fig = plt.gcf()
fig.set_size_inches(5, 5)

plt.tick_params(axis='x', labelbottom='off')
plt.yticks(np.linspace(-1, 1, 3))

plt.xlabel(r"$q_k$")
plt.ylabel(r"$p_i / p_\mathrm{max}$")

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
