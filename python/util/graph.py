from collections import defaultdict

edges = [('a', 'b'), ('a', 'b'), ('a', 'c')]


matrix = defaultdict(int)
for edge in edges:
    matrix[edge] += 1

print matrix['a', 'b']
# >> 2


adj_list = defaultdict(lambda: defaultdict(lambda: 0))
for start, end in edges:
    adj_list[start][end] += 1

print adj_list['a']
# >> {'c': 1, 'b': 2}
