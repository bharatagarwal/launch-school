# return array of fibonacci numbers upto given number
# 1, 1, 2, 3, 5, 8, 13...

def fibonacci(number)
  return 1 if [1,2].include?(number)
  fibonacci = []
  
  first = 1
  second = 1
  index = 2

  fibonacci << first
  fibonacci << second

  while index <= number
    first, second = second, second + first
    fibonacci << second
    index += 1
  end

  fibonacci.last
end

def find_fibonacci_index_by_length(fibonacci_length)
  length = 0
  index = 1
  while length < fibonacci_length
    length = fibonacci(index).to_s.size
    index += 1
  end

  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
