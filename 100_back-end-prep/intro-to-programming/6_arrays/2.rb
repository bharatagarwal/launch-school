# What will the following programs return? What is value of arr after each?

arr = ["b", "a"]
arr = arr.product(Array(1..3)) # [1,2,3]
arr.first.delete(arr.first.last)

# product is b,1 b,2 b,3 a,1 a,2 a,3.
# out of which, b, 1 will lose 1, and that
# will be returned by delete

arr = ["b", "a"]
arr = arr.product([Array(1..3)]) # [[1,2,3]]
arr.first.delete(arr.first.last)

# product will be b, [1,2,3] & a, [1,2,3].
# [1,2,3] will be deleted and returned from
# first element.