ABC_THRESHOLD = 18

def sum_of_squares assignment, branches, conditionals
  assignment ** 2 + branches ** 2 + conditionals ** 2
end

def abc_size assignment, branches, conditionals
  abc = Math.sqrt(sum_of_squares(assignment, branches, conditionals))
  abc.round(2)
end

def equal_values
  ABC_THRESHOLD / 3**Rational(1,2)
end

def zero_and_two_equal_values
  ABC_THRESHOLD / 2**Rational(1,2)
end

p equal_values.round(2)
p zero_and_two_equal_values.round(2)
p abc_size(10, 32, 5)
p abc_size(10, 12, 5)
