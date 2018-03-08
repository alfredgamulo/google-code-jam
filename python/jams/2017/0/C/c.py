# https://code.google.com/codejam/contest/3264486/dashboard#s=p2
# attempt at optimizing for second small sample, doesn't work :(

import json

def is_power2(num):
	'states if a number is a power of two'
	return num != 0 and ((num & (num - 1)) == 0)

def fill(d,k):
    for key,value in sorted(d.iteritems()):
        if key == 1:
            continue
        p = d[key/2]
        if key % 2 == 0:
            d[key] = (p)/2
        else:
            d[key] = (p-1)/2

def do_jam(input):
    n,k = input.split(' ')
    n = int(n)
    k = int(k)

    d = {1:n}
    i = k
    while i > 0:
        d[2*i] = 0
        d[2*i+1] = 0
        i = i/2

    fill(d,k)
    return "{} {}".format(d[k*2],d[k*2+1])

########
# MAIN #
########
T= int(raw_input())
for i in xrange(1, T + 1):
    print "Case #{}: {}".format(i, str(do_jam(raw_input())))
