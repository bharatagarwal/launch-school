# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

# this is using map, which is used for transformation

array = Array(1..10)

array2 = array.map { |v| v+2 }

p array
p array2

# using each, because question asks for iteration.

array2 = []

array.each { |v| array2 << v+2 }

p array
p array2