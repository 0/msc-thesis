from matplotlib import cm

import numpy as np


COLORS = ['blue', 'magenta', 'lime', 'grey', 'orange', 'cyan', 'khaki']
HISTOGRAM_COLOR = '#bbccff'
COLORMAP = cm.YlOrRd
COLORMAP_PHASE = cm.hsv

EXACT_ENERGIES = [
        1.0,
        1.3660254037844,
        2.0,
        3.3722813232690,
        6.1789083458003,
        ]

EXACT_TRACES = [
        1.0,
        0.9634330440023,
        0.8660254037844,
        0.7107300658431,
        0.5454257963224,
        ]

EPS = 1e-8


def entropize(trace):
    return -np.log(trace)

def entropize_err(trace, err):
    return err / trace

def gaussian(var, xs, norm=None):
    if norm is None:
        norm = np.sqrt(2. * np.pi * var)

    return np.exp(-0.5 * xs * xs / var) / norm


def signed_sqrt(vs):
    signs_imag = np.sign(vs.imag)
    signs_imag[signs_imag == 0] = 1
    signs_imag_rolled = np.roll(signs_imag, 1)
    signs_imag_rolled[0] = signs_imag[0]
    transitions = np.logical_or(np.sign(vs.real) >= 0, signs_imag == signs_imag_rolled)

    return np.cumprod(2 * transitions - 1) * np.sqrt(vs)
