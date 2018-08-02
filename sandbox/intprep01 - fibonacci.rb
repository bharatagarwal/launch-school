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

  fibonacci
end

p fibonacci(4)
p fibonacci(7)