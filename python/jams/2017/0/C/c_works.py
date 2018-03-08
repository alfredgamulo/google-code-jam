# https://code.google.com/codejam/contest/3264486/dashboard#s=p2
# works for first small sample, times out for second small sample

def do_jam(input):
    n,k = input.split(' ')
    n = int(n)
    k = int(k)

    s = [n]
    l = 0
    r = 0
    d = {1:n}
    iterable = iter(xrange(k))
    for i in iterable:
        m = max(s)
        s.remove(m)
        r = (m-1)/2
        l = m/2
        d[i+2]=l
        d[i+3]=r
        s.append(l)
        s.append(r)
    return "{} {}".format(l,r)


########
# MAIN #
########
T= int(raw_input())
for i in xrange(1, T + 1):
    print "Case #{}: {}".format(i, str(do_jam(raw_input())))
