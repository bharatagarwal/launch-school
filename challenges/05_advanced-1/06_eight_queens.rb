require 'pry'

# In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal.

# A chessboard can be represented by an 8 by 8 array.

# So if you're told the white queen is at (2, 3) and the black queen at (5, 6), then you'd know you've got a set-up like so:

# White: 2, 3
# y, x
# Black: 5, 6
# y, x

# 0 1 2 3 4 5 6 7
# _ _ _ W _ _ _ _ 0
# _ _ _ _ _ _ _ _ 1
# _ _ _ _ _ _ _ _ 2
# _ _ _ _ _ _ _ _ 3
# _ _ _ _ _ _ _ _ 4
# _ _ _ _ _ _ _ _ 5
# _ _ _ _ _ _ _ _ 6
# _ _ _ W _ _ _ _ 7


# You'd also be able to answer whether the queens can attack each other. In this case, that answer would be yes, they can, because both pieces share a diagonal.

# in the format y, x

class Queens
  attr_reader :white, :black, :board
  
  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black

    @white = white
    @black = black
    create_board
    mark_white
    mark_black
  end

  def to_s
    @board.map do |line|
      line.join(' ')
    end.join("\n")
  end

  def attack?
    @white[0] == @black[0] ||
      @white[1] == @black[1] ||
      diagonal_attack?
  end

  private

  def create_board
    @board = Array.new(8, Array.new(8, '_'))
  end

  def mark_white
    white_y = @white[0]
    white_x = @white[1]
    @board[white_y][white_x] = 'W'
  end

  def mark_black
    black_y = @black[0]
    black_x = @black[1]
    @board[black_y][black_x] = 'B'
  end

  def diagonal_attack?
    delta_y = @black[0] - @white[0]
    delta_x = @black[1] - @white[1]
    delta_x.abs == delta_y.abs
  end
end

binding.pry
queens = Queens.new
