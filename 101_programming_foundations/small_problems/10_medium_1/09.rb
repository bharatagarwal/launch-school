# 7
# 1 1 2 3 5


def fibonacci(number)
  return 1 if number == 1 || number == 2

  fibonacci_series = [1, 1]

  (2..number - 1).each do |n|
    fibonacci_series << fibonacci_series[n - 1] + fibonacci_series[n - 2]
  end

  fibonacci_series[-1]
end

p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(20)
p fibonacci(20) == 6765
p fibonacci(100)
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
