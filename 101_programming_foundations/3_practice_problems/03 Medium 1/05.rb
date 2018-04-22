limit = 15

# limit is not in method scope, so pass it as an argument.

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 2, limit)
puts "result is #{result}"