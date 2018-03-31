from sys import stdin
from functools import partial

stdin_readline = stdin.readline
fprint = partial(print, flush=True)

def do_jam(input):
    pass


########
# MAIN #
########
T= int(stdin_readline())
for i in range(1, T + 1):
    fprint("Case #{}: {}".format(i, str(do_jam(stdin_readline()))))
