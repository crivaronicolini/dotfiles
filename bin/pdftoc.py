#!/home/marco/repos/miniconda3/bin/python3
import os
import subprocess as sub
import sys

filenames = sys.argv[1:]
cd = os.getcwd()
for filename in filenames:
    os.popen(f'xdg-open {filename}')
    # primera = input('elegi la primera pagina del TOC: ')
    # ultima = input('elegi la ultima pagina del TOC: ')
    # principio = input('en que pagina empieza el libro? ')
    primera, ultima, principio = 7, 19, 31
    caca = sub.run(
        [f'pdftotext -f {primera} -l {ultima}', f'{os.path.join(cd,filename)}'], capture_output=True)
    print(caca)
