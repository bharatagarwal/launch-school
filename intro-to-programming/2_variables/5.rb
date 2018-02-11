x = 0
3.times do
  x += 1
end
puts x

# output of 3, because .times method has access to variable defined
# in outer scope

y = 0
3.times do
  y += 1
  x = y
end
puts x

# error, because x is declared inside .times method, and will not be accessible in the 'main' class.