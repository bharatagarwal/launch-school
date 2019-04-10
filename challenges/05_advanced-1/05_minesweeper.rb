# board checks for:
# check for border validity
# check that all inputs have same length
# check that there are no invalid inputs in the diagram.

# problem
# -------

# given an input array of lines, examine whether board is appropriate
# if it is appropriate, transform the board to produce hints regarding mines.

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

  def valid?
    pluses_at_corners &&
      dashes_at_top_and_bottom &&
      pipes_at_sides &&
      equal_lengths &&
      stars_and_spaces
  end

  def pluses_at_corners
    @board.first.first.corner? &&
      @board.first.last.corner? &&
      @board.last.first.corner? &&
      @board.last.last.corner?
  end

  def dashes_at_top_and_bottom
    @board.first[1..-2].all? { |v| v.value == '-'} &&
      @board.last[1..-2].all? { |v| v.value == '-'}
  end

  def pipes_at_sides
    @board[1..-2].map { |line| line.first.value }.all? { |v| v == '|'} &&
      @board[1..-2].map { |line| line.last.value }.all? { |v| v == '|'}
  end

  def equal_lengths
    first_length = @board.first.size
    @board.all? { |line| line.size == first_length }
  end

  def stars_and_spaces
    @board[1..-2].all? do |line|
      line[1..-2].all? do |point|
        point.value == '*' || point.value == ' '
      end
    end
  end

  def transform
    @board.map.with_index do |lines, line_index|
      lines.map.with_index do |point, row_index|
        if point.corner? || point.wall? || point.star?
          point.value
        else
          reference_points = [
            @board[line_index - 1][row_index].value,
            @board[line_index + 1][row_index].value,
            @board[line_index][row_index - 1].value,
            @board[line_index][row_index + 1].value,
            @board[line_index - 1][row_index - 1].value,
            @board[line_index - 1][row_index + 1].value,
            @board[line_index + 1][row_index - 1].value,
            @board[line_index + 1][row_index + 1].value,
          ]
          point.compute_value(reference_points)
        end
      end.join('')
    end
  end

  def self.transform(input)
    board = new(input)
    raise ValueError unless board.valid?
    board.transform
  end
end

class Point
  attr_reader :value

  def initialize(value)
    @value = value
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

  def compute_value(reference_points)
    # reference_points format
    # up, down, left, right, left_up, left_down, right_up, right_down
    count = reference_points.count('*')
    count == 0 ? ' ' : count.to_s
  end
end