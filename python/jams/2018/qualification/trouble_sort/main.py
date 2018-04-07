from sys import stdin
from functools import partial

stdin_readline = stdin.readline
fprint = partial(print, flush=True)

def do_jam():
    n = int(stdin_readline())
    v = list(map(int,stdin_readline().split()))

    e = sorted(v[0::2])
    o = sorted(v[1::2])
    a = []
    for i in range(0,len(e)):
        a.append(e[i])
        if i < len(o):
            a.append(o[i])
    return next((i for i in range(0,len(a)-1) if a[i] > a[i+1]), 'OK')

########
# MAIN #
########
T= int(stdin_readline())
for i in range(1, T + 1):
    fprint("Case #{}: {}".format(i, str(do_jam())))


