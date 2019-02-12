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
  attr_reader :rail_indices
  def initialize(string, number)
    @string = string
    @number = number

  end

  def initialize_dots
    @arrays = []
    @number.times do
      @arrays << ['.'] * @string.size
    end
  end

  def create_rail_indices
    @rail_indices = []

    loop do
      @rail_indices += (0..@number - 1).to_a
      break if @rail_indices.size > @string.size  
      @rail_indices += (1..@number - 2).to_a.reverse
      break if @rail_indices.size > @string.size
    end

  end
  
  def encode
    initialize_dots
    create_rail_indices

    @string.chars.each_with_index do |char, index|
      @arrays[@rail_indices[index]][index] = char
    end

    @arrays.each do |array|
      p array
    end
    
    strip_dots!(@arrays).join('')
  end

  def strip_dots!(array)
    array.map do |arr|
      arr.delete('.')
      arr
    end
  end

  def self.encode(string, number)
    new(string, number).encode
  end
end