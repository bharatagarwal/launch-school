def fibonacci(number)
  return 'invalid' if number < 0
  return 0 if number == 0
  return 1 if number == 1
    fibonacci(number-2) + fibonacci(number-1)
end

p fibonacci -11