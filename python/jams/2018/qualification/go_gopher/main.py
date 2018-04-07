from sys import stdin
from sys import stderr
from sys import exit
from functools import partial

stdin_readline = stdin.readline
fprint = partial(print, flush=True)
sprint = partial(print, file=stderr)

def do_jam():
    a = int(stdin_readline())
    y_max = 4 if a == 20 else 40
    big_a = [[False for y in range(0,y_max)] for x in range(0,5)] 

    for i in range(0, 1000):
        x, y = next((x,y) for x in range(0,5) for y in range(0,y_max) if not big_a[x][y])
        if x == 0:
            x = 1
        if y == 0:
            y = 1
        if x == 4:
            x = 3
        if y == y_max - 1:
            y = y_max - 2
        x = x + 500
        y = y + 500
        fprint(x,y)
        fx, fy = stdin_readline().rstrip().split()
        if fx == "-1" and fy == "-1":
            exit("CRAP!")
        if fx == "0" and fy == "0":
            break

        fx, fy = map(int,(fx,fy))      
        big_a[fx-500][fy-500] = True
        
########
# MAIN #
########
T= int(stdin_readline())
for i in range(1, T + 1):
    do_jam()
