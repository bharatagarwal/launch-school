# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def npower(num, exponent)
  result = 1
  exponent.times { result = multiply(result, num)}
  result
end

p square(5) == 25
p square(-8) == 64

p npower(5,3) == 125
p npower(-6, 3)