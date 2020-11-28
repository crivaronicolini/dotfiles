#!/home/marco/repos/miniconda3/bin/python3
import matplotlib.pyplot as plt
import numpy as np
import os

arch = [f for f in os.listdir('.') if f.endswith('dat')]
c = False
trans = False
colores = ['r', 'b', 'g', 'm']
for i, inp in enumerate(arch):
    a, x, y = np.loadtxt(inp, unpack=True)
    nom = inp[:-4]
    x = x/(6.92e3)
    y = y/(6.92e3)
    # plt.clf()
    if c:
        if trans:
            plt.plot(a, np.fft.fft(x), label='fase')
            plt.plot(a, np.fft.fft(y), label='contrafase')

        else:
            plt.plot(a, x, label='fase')
            plt.plot(a, y, label='contrafase')
        plt.title(nom)
        plt.legend(loc='best')
        plt.xlabel('angulo')
        plt.ylabel('V')
        plt.tight_layout()
        plt.show()
        # plt.savefig(nom + '.png')
        # plt.clf()
        # break

        # pass
    else:
        plt.plot(a, x, c=colores[i])
        plt.plot(a, y, c=colores[i], label=nom.split('_')[2])

    # plt.plot(a, x, label='fase')
    # plt.plot(a, y, label='contrafase')
if not c:
    plt.legend(loc='best')
    plt.xlabel('angulo')
    plt.ylabel('uV')
    plt.tight_layout()
    plt.savefig('fondos_juntos.png')
    # plt.show()
