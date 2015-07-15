#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
frictions = [
        '0',
        '0.00001',
        '0.0001',
        '0.001',
        '0.01',
        '0.1',
        '1',
        '10',
        '100',
        ]  # 1/ps


for i, friction in enumerate(frictions):
    plt.plot(data[:, 0], data[:, 1+i], color=COLORS[i], label=r'$\gamma^{(0)} = \SI{' + friction + r'}{\per\pico\second}$')

fig = plt.gcf()
fig.set_size_inches(10, 3)

plt.title(r'Binning convergence for minimal estimator (quotient)')
plt.xlabel(r'Binning level')
plt.ylabel(r'Standard error of trace')

plt.legend(prop={'size': 6}, loc=2)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
