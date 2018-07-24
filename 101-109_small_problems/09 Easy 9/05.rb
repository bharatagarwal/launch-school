# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

def strip_nonalpha(string)
  string.chars.select { |char| char.match?(/[a-zA-Z]/)}
end

def uppercase?(string)
  strip_nonalpha(string).all? { |char| char == char.upcase}
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true