def fibonacci_last(number)
  return 1 if number == 1 || number == 2

  fibonacci_series = [1, 1]

  (2..number - 1).each do |n|
    fibonacci_series << (fibonacci_series[n - 1] + fibonacci_series[n - 2]) % 10
  end

  fibonacci_series[-1]
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4