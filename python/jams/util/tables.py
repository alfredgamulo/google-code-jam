'''
>>> import itertools
>>> a = [1, 2, 3]
>>> b = [4, 5, 6]
>>> c = itertools.chain(a, b)

>>> for i in c:
...     print i
1
2
3
4
5
6
'''



'''
>>> list1, list2, list3 = [1,2,3], ['a','b','c'], [7,8,9]
>>> all_lists = sum([list1, list2, list3], [])
>>> all_lists
[1, 2, 3, 'a', 'b', 'c', 7, 8, 9]
'''


'''
>>> k = [1,2,3] + [4,7,9]
>>> k
[1, 2, 3, 4, 7, 9]
'''


'''
aList = [123, 'xyz', 'zara', 'abc']

aList.insert( 3, 2009)

print "Final List : ", aList

Final List : [123, 'xyz', 'zara', 2009, 'abc']

'''
