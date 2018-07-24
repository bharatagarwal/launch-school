require 'pry'

# input: array of strings
# output: vowels removed

# green, yellow, black, white
# grn, yllw, blck, wht

VOWELS = %w(a e i o u)

# def remove_vowels(strings)
#   strings.map do |string|
#     string.chars.map do |char|
#       if VOWELS.include?(char)
#         ''
#       else
#         char
#       end

#     end.join
#   end

# end

def remove_vowels(strings)
  binding.pry
  strings.map do |string|
    chars = string.chars
    VOWELS.each { |vowel| chars.delete(vowel) }
    chars.join('')
  end

end

p remove_vowels( %w(green yellow black white))