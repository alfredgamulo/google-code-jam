from sys import stdin
from sys import exit
from functools import partial

stdin_readline = stdin.readline
fprint = partial(print, flush=True)

def do_jam():
    a, b = map(int,stdin_readline().rstrip().split())
    n = int(stdin_readline().rstrip())
    for i in range(n):
    	g = b - (b - a)//2
    	fprint(g)
    	feedback = stdin_readline().rstrip()
    	if feedback == "CORRECT":
    		break
    	elif feedback == "TOO_SMALL":
    		a = g
    	elif feedback == "TOO_BIG":
    		b = g-1
    	elif feedback == "WRONG_ANSWER":
    		exit("CRAP!")

########
# MAIN #
########
T= int(stdin_readline())
for i in range(1, T + 1):
    do_jam()
