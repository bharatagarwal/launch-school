# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# problem
# input - year as Integer
# output: String, identify century.
# 1901 - 2000: 20th century
# 2001: 21st century

# algorithm
# divide number by 100, and if last digits are 00, then divisor-th century
# if last digit not 00, then return divisor+1-th century

def nth(number)
  return 'th' if [11,12,13].include?(number % 100)

  last_digit = number % 10

  case last_digit
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else 'th'
  end
end

def century(number)
  quotient, remainder = number.divmod(100)
  if remainder == 0
    "#{quotient}#{nth(quotient)}"
  else
    "#{(quotient + 1)}#{nth(quotient + 1)}"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'