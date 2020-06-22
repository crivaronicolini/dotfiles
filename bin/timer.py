#!/home/marco/repos/miniconda3/bin/python3
import time
from tqdm import tqdm
import sys

# secs, *arg = 1, 'h'
secs, *arg = sys.argv[1:]
if arg:
    if arg == ['m']:
        mod = 60
    elif arg == ['h']:
        mod = 3600
    timer = int(secs) * mod
else:
    timer = int(secs)
    arg = ['s']

pbar = tqdm(range(timer), ncols=30, bar_format='{elapsed} {bar} {desc}')
try:
    for i in pbar:
        time.sleep(1)
        pbar.set_description_str(f' {secs}{arg[0]}')
except KeyboardInterrupt:
    print('\nchau!')
    sys.exit(0)
