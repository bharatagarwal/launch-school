def factorial num
  if num < 0
    return 'You cannot take the factorial of a negative number!'
  end

  if num <= 1
    1
  else
    num * factorial(num - 1)
  end

end

puts factorial (31)
puts factorial (0)
puts factorial (-11)