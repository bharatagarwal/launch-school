require 'pry'

# W . . . E . . . C . . . R . . . L . . . T . . . E
# . E . R . D . S . O . E . E . F . E . A . O . C .
# . . A . . . I . . . V . . . D . . . E . . . N . .

# Three rails, then flattened.

# create 'n' arrays of length of input, filled with '.'
# iterate over each alphabet in input, and keep cycling 
# through array indices while placing in corresponding index
# input string

class RailFenceCipher
  def initialize(string, number)
    @string = string
    @number = number
    initialize_dots
  end

  def initialize_dots
    single_dot_array = Array.new(@string.size, '.')
    @arrays = Array.new(@number, single_dot_array)
  end

  def encode
    @string.chars.each_with_index do |char, index|
      @arrays[index % 3][index] = char
      binding.pry
    end

    @arrays

    #@arrays.map do |array|
    #  array.delete('.')
    #  array
    #end.join('')
  end
end

p RailFenceCipher.new("WEAREDISCOVEREDFLEEATONCE", 3).encode