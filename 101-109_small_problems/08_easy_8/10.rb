# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

# Launchschool 12. pop off half - 1
# 01234567890123
# Launch School 13. pop off num - 1/ 2
# 01234567890123

def center_of(string)
  length = string.length
  new_string = string.chars

  if length.even?
    new_string.pop(length / 2 - 1)
    new_string.shift(length / 2 - 1)
  else
    new_string.pop( (length - 1) / 2)
    new_string.shift( (length - 1) / 2)
  end

  new_string.join('')
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'