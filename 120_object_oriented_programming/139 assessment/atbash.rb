# problem
# -----
# input: string
# output: string

# take input string, parse text, removing any space or punctuation
# or upcase characters.

# return ciphered text, in words of length 5 separated by a comma.
# return numbers as they are

# examples
# -----

# yes
# y -> b, e -> v, s -> h
# identify group, return corresponding index

# testi ng123 testi ngsss a
# hvhgr mt123 hvhgr mt
# assert_equal follows assert(exp, act, msg) syntax

# data structures
# -----

# input text as a string
# parsing: select from array of characters of input
# substitution via indexes of two arrays representing two groups
# output: create batches of size 5.

# algorithm
# -----

# convert the given string into lowercase
# select from array of characters, only those characters that are strings
# or numbers
# join this array into a string with no spacing
# substitute the values of the characters, first identifying group
# and substituting for the corresponding index in the other group,
# returning a numeric value as is.
# create sliced batches of 5, looping over index till index reaches size
# join this with a ' ' delimiter.

class Atbash
  FIRST_GROUP = ('a'..'m').to_a
  SECOND_GROUP = ('n'..'z').to_a.reverse

  def initialize(input_string)
    @input_string = input_string
    @parsed_input = parse(@input_string)
  end

  def encode
    substituted_string = substitute_characters(@parsed_input)
    format(substituted_string)
  end

  def self.encode(string)
    new(string).encode
  end

  private

  def parse(string)
    string
      .downcase
      .chars
      .select { |char| /[a-z0-9]/.match(char) }
      .join('')
  end

  def substitute_characters(string)
    string.chars.map do |char|
      if FIRST_GROUP.include?(char)
        SECOND_GROUP[FIRST_GROUP.index(char)]
      elsif SECOND_GROUP.include?(char)
        FIRST_GROUP[SECOND_GROUP.index(char)]
      else
        char
      end
    end.join('')
  end

  def format(string)
    index = 0
    batches_of_five = []

    while index < string.length
      batches_of_five << string[index...index + 5]
      index += 5
    end

    batches_of_five.join(' ')
  end
end
