#!/home/marco/repos/miniconda3/bin/python3
# vim: set filetype=python:
import time
from tqdm import tqdm
import sys
mins, *arg = sys.argv[1].split()
if mins == '':
    print('Usage:\n$ timer <time> <unit>\n<unit> can be s seconds, h hours. Defaults to minutes')
    sys.exit(0)
if arg:
    if arg == ['s']:
        mod = 1/60
    elif arg == ['h']:
        mod = 3600
    timer = int(mins) * mod
else:
    timer = int(mins) * 60
    arg = ['m']

pbar = tqdm(range(int(timer)), ncols=30, bar_format='{elapsed} {bar} {desc}')
for i in pbar:
    try:
        time.sleep(1)
        pbar.set_description_str(f' {mins}{arg[0]}')
    except KeyboardInterrupt:
        ans = input('\npausaste el timer, continuar [C]? salir [s]?\n')
        if ans == 's':
            print('\nchau!')
            sys.exit(0)
        continue
# try:
#     for i in pbar:
#         time.sleep(1)
#         pbar.set_description_str(f' {secs}{arg[0]}')
# except KeyboardInterrupt:
#     print('\nchau!')
#     sys.exit(0)
