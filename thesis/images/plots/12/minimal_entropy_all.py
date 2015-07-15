#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS, entropize, entropize_err


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))


values = data[:, 1]
errs = data[:, 2]

ratios = np.linspace(0, 10.5, 1000)
omega_Rs = 1  # K
omega_rs = np.sqrt(1 + 2 * ratios * ratios)  # K
xs = np.sqrt(omega_Rs / omega_rs) - np.sqrt(omega_rs / omega_Rs)
plt.plot(ratios, 0.5 * np.log(1 + 0.25 * np.power(xs, 2)), linestyle='dashed', color='black')

plt.errorbar(data[:, 0], entropize(values),
             yerr=entropize_err(values, errs),
             linestyle='None',
             marker='o',
             capsize=6,
             color=COLORS[0])

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Entanglement entropy of coupled harmonic oscillators')
plt.xlabel(r'$\omega_\mathrm{int} / \omega_0$')
plt.ylabel(r'$S_2$')

plt.xlim(0.0, 10.5)

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
