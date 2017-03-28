#
# User: ghost.core
#
# ===============================
# CODEJAM
# ===============================
#

mod = 1000000007

def do_jam(input):
    slen = len(input)
    if(slen == 1):
        return 1
    if(slen == 2):
        if(input[0] == input[1]):
            return 1
        else:
            return 4

    ans = 1

    if(input[0] != input[1]):
        ans = (ans * 2) % mod
    if(input[-1] != input[-2]):
        ans = (ans * 2) % mod

    for i in xrange(1, slen - 1):
        c = 1
        if(input[i] != input[i-1]):
            c+=1
        if((input[i+1] != input[i-1]) and (input[i] != input[i+1])):
            c+=1
        ans = (ans * c) % mod

    return ans % mod


########
# MAIN #
########
T= int(raw_input())
for i in xrange(1, T + 1):
    print "Case #{}: {}".format(i, str(do_jam(raw_input())))
