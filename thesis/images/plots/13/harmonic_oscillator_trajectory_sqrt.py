#!/usr/bin/env python3

from os.path import basename, splitext
from sys import argv

from matplotlib import pyplot as plt

import numpy as np

from misc import COLORS


name = splitext(basename(argv[0]))[0]

data = np.loadtxt('{}.data'.format(name))
dts = np.sort(np.unique(data[:, 0]))
ts = np.sort(np.unique(data[:, 1]))


mass = 0.0005485799  # g/mol
omega = 0.13092033091438  # 1/ps
init_p = -5e-3  # g nm/ps mol
init_q = 50.  # nm
hk = 0.06248  # 1

exact_ps = np.cos(omega * ts) * init_p - mass * omega * np.sin(omega * ts) * init_q  # g nm/ps mol
exact_qs = np.sin(omega * ts) * init_p / (mass * omega) + np.cos(omega * ts) * init_q  # nm
exact_Rs = np.sqrt(np.cos(omega * ts) - 0.5j * (hk + 1./hk) * np.sin(omega * ts))


_, axes = plt.subplots(2, sharex=True)

axes[0].plot(ts, exact_Rs.real, linestyle='dashed', linewidth=2, color='black')
axes[1].plot(ts, exact_Rs.imag, linestyle='dashed', linewidth=2, color='black')


for i, dt in enumerate(dts):
    d = data[data[:, 0] == dt]
    ts = d[:, 1]
    Rs_real = d[:, 4]
    Rs_imag = d[:, 5]

    axes[0].plot(ts, Rs_real, color=COLORS[i], label='$\Delta t^\star = \SI{' + str(dt) + '}{\pico\second}$')
    axes[1].plot(ts, Rs_imag, color=COLORS[i], label='$\Delta t^\star = \SI{' + str(dt) + '}{\pico\second}$')

fig = plt.gcf()
fig.set_size_inches(10, 12)

axes[0].set_title(r'HK prefactor of harmonic oscillator trajectories')
axes[1].set_xlabel(r'$t / \si{\pico\second}$')
axes[0].set_ylabel(r'$\Re{(R_t)}$')
axes[1].set_ylabel(r'$\Im{(R_t)}$')

for axis in axes:
    axis.legend(prop={'size': 6})

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
