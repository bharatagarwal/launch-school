a = 2 #immutable
b = [5, 8] # mutable
arr = [a, b]
# [2, [5,8]]


arr[0] += 2
# 4
arr[1][0] -= a
# 3

# a remains 2
# b changes to [3, 8]