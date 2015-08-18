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

exact_ps = np.cos(omega * ts) * init_p - mass * omega * np.sin(omega * ts) * init_q  # g nm/ps mol
exact_qs = np.sin(omega * ts) * init_p / (mass * omega) + np.cos(omega * ts) * init_q  # nm

plt.plot(exact_qs, exact_ps, linestyle='dashed', linewidth=2, color='black')


for i, dt in enumerate(dts):
    d = data[data[:, 0] == dt]
    ps = d[:, 2]
    qs = d[:, 3]

    plt.plot(qs, ps, color=COLORS[i], label='$\Delta t^\star = \SI{' + str(dt) + '}{\pico\second}$')

fig = plt.gcf()
fig.set_size_inches(10, 5)

plt.title(r'Phase space of harmonic oscillator trajectories')
plt.xlabel(r'$q / \si{\nano\meter}$')
plt.ylabel(r'$p / \si{\gram\nano\meter\per\pico\second\per\mole}$')

plt.legend()

plt.savefig('{}.pdf'.format(name), bbox_inches='tight')
