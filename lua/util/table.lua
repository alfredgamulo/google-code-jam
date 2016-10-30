--[[


list = {1,2,3,4,5,6,7,8,9,10}
print(unpack(list)) -- prints out 1 2 3 4 5 6 7 8 9 10
print(unpack(list, 2)) --prints out 2 3 4 5 6 7 8 9 10
print(unpack(list, 3, 5))--prints out 3 4 5



list = {1,2,"a"}
print(table.concat(list)) -- 12a
print(table.concat(list,", ")) -- 1, 2, a
print(table.concat(list,",", 2)) -- 2,a
print(table.concat(list,"WEE",1,2)) -- 1WEE2


list = {1,2,3}
table.insert(list,4) -- list is now {1,2,3,4}
table.insert(list,2,4) -- list is now {1,4,2,3,4}

list = {1,2,3,4,5}
table.remove(list) -- list is now {1,2,3,4}
table.remove(list, 2) -- list is now {1,3,4}


list = {5,2,3,6,1}
table.sort(list) -- list is now {1,2,3,5,6}


]]