from sys import stdin
from functools import partial

stdin_readline = stdin.readline
fprint = partial(print, flush=True)

def run_program(p):
    strength = 1
    damage = 0
    for x in p:
        if x == "S":
            damage = damage + strength
        else:
            strength = strength + strength
    return damage

def swap(s, x):
    return ''.join((s[:x], s[x+1], s[x], s[x+2:]))

def do_jam():
    d, p = stdin_readline().split()
    d = int(d)

    c = 0
    sk = ('C','S')
    while run_program(p) > d:
        z = list(zip(p,p[1:]))
        f = z.index(sk) if sk in z else None
        if f != None:
            p = swap(p, f)
            c = c + 1
        else:
            return "IMPOSSIBLE" 

    return c

########
# MAIN #
########
T= int(stdin_readline())
for i in range(1, T + 1):
    fprint("Case #{}: {}".format(i, str(do_jam())))


