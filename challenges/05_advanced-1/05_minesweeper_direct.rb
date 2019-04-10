require 'pry'

# Minesweeper is a popular game where the user has to find the mines using numeric hints that indicate how many mines are directly adjacent (horizontally, vertically, diagonally) to a square.

# at every available point in the board, check for surrounding *'s on each of the element above, below, right, left, and on the diagonals.

# board checks for:
# check for border validity
# check that all inputs have same length
# check that there are no invalid inputs in the diagram.

# problem
# -------

# given an input array of lines, examine whether board is appropriate
# if it is appropriate, transform the board to produce hints regarding mines.

# examples
# -------


# +-----+    +-----+
# | * * |    |1*3*1|
# |  *  |    |13*31|
# |  *  |    | 2*2 |
# |     |    | 111 |
# +-----+    +-----+

# +------+    +------+
# | *  * |    |1*22*1|
# |  *   |    |12*322|
# |    * |    | 123*2|
# |   * *|    |112*4*|
# | *  * |    |1*22*2|
# |      |    |111111|
# +------+    +------+

class ValueError < StandardError
end

class Board
  def initialize(input_lines)
    @board = input_lines.map do |line|
      line.split('').map do |char|
        Point.new(char)
      end
    end
  end

  def compute_count
    @board.map.with_index do |lines, line_index|
      lines.map.with_index do |point, row_index|
        next unless point.star?


        end
      end
    end
  end

  def self.transform(input)
    board = new(input)
    raise ValueError unless board.valid?
    # binding.pry
    board.transform
  end
end

class Point
  attr_reader :value

  def initialize(value)
    @value = value
    @count = 0
  end

  def wall?
    @value == '|' || value == '-'
  end

  def corner?
    @value == '+'
  end

  def star?
    @value == '*'
  end

  def increment_surrounding(reference_array)
    reference_array.each do |surrounding_point|
      
  end
end