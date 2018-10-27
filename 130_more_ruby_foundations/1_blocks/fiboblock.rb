def fib_upto(max)
  first, second = 1, 1
  while first <= max
    yield first
    first, second = second, first + second
  end
end

fib_upto(1000) { |f| print f, " "}

# >> 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987