
import itertools

def generate_binary_table(n_bits):
    list(itertools.product("01", repeat=n_bits))

def xor(x,y):
    return x ^ y

def binary_string_xor(x,y):
    return int(x,2) ^ int(y,2)


print xor(1,2)

print binary_string_xor("101","010")
