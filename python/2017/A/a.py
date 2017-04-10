# https://code.google.com/codejam/contest/3264486/dashboard#s=p0

def to_bin(s):
    if s == '+':
        return True
    return False

def do_jam(input):
    s, k = input.split(' ')
    k = int(k)

    s = map(to_bin,s)

    c = 0
    while not all(s):
        i = s.index(False)
        if i > (len(s) - k):
            return "Impossible"
        for j in xrange(i, i+k):
            s[j] = not s[j]
        c = c+1
    return c


########
# MAIN #
########
T= int(raw_input())
for i in xrange(1, T + 1):
    print "Case #{}: {}".format(i, str(do_jam(raw_input())))
