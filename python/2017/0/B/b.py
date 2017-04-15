# https://code.google.com/codejam/contest/3264486/dashboard#s=p1

def is_tidy(l):
    return all(l[i] <= l[i+1] for i in xrange(len(l)-1))

def do_jam(input):
    for i in xrange(int(input), 0, -1):
        if (is_tidy(list(str(i)))): return i

########
# MAIN #
########
T= int(raw_input())
for i in xrange(1, T + 1):
    print "Case #{}: {}".format(i, str(do_jam(raw_input())))
