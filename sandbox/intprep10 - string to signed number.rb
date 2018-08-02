NUMBERS = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_signed_integer(string)
  
  if string[0] == '-'
    positivity = -1
    string[0] = ''
  elsif string[0] == '+'
    positivity = 1
    string[0] = ''
  else
    positivity = 1
  end

  digits = string.chars.map do |char|
             NUMBERS.index(char)
           end 

  integer_value = digits.reduce(0) do |sum, val|
                    10 * sum + val
                  end

  positivity * integer_value                  
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100