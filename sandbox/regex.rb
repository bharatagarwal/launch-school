str = 'cassst'
puts str.match(/s/).inspect
puts str.match(/x/)

# match(pattern) → matchdata or nil
# meta-characters: $ ^ + ? . ( ) [ ] { } | \
# meta characters need to be escaped with a leading backlash. \
# non alphanumeric that you may think are are meta but aren't : & space.

# meta meaning of () - to group content together
# meta meaning of | - OR.
# ^ means negation
# ^ beginning of line, $ end of line.

# text=gets.chomp
# puts "has tab" if text.match(/\t/)

# \n - line feed
# \r - carriage return
# \t - tab

# /launch/i
# i is appended to the close to ignore case
# this is called option, or flag, or modifier.

# single character classes have their own uses.
# don't remove square brackets from, say, /[a]/ is you encounter it.

# Inside character classes, the number of meta-characters dwindles to a small amount: ^ \ - [ ]

def hex_digit?(char)
  char.match(/[0-9A-Fa-f]/)
end

text = 'xyx'
puts 'matched' if text.match(/[^x]/)

puts 'matched 1' if 'Four score'.match(/\s/)
puts 'matched 2' if "Four\tscore".match(/\s/)
puts 'matched 3' if "Four-score\n".match(/\s/)
puts 'matched 4' if "Four-score".match(/\s/)

# \s...\s
# Doc in a _big _ed box.
# Hup!_ 2 3 _4
# won't match red becayse the whitespace has already been taken up by the previous regex match in the engine!


# * 0 or more occurances
# + 1 or more occurances
# ? 0 or 1 occurnaces
