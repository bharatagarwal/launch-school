# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# problem
# take two strings as input
# find longer and shorter
# short + long + short

def short_long_short(first, second)
  first.length > second.size ? "#{second}#{first}#{second}" : "#{first}#{second}#{first}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"