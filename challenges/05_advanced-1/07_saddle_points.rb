class Matrix
  attr_reader :rows, :columns, :saddle_points

  def initialize(string)
    @rows = string.split("\n").map do |substr| 
              substr.split(" ").map(&:to_i)
            end
    create_columns
    @saddle_points = []
    compute_saddle_points
  end

  def create_columns
    @columns = []

    (0...@rows.first.size).each do |column_index|
      column = []
      (0...@rows.size).each do |row_index|
        column << @rows[row_index][column_index]
      end
      @columns << column
    end
  end

  def compute_saddle_points
    @rows.each_index do |row_index|
      @columns.each_index do |column_index|
        element = @rows[row_index][column_index]
        if saddle_point?(element, row_index, column_index)
          @saddle_points << [row_index, column_index]
        end
      end
    end
  end

  def saddle_point?(element, row_index, column_index)
    @rows[row_index].all? { |row_item| element >= row_item } &&
      @columns[column_index].all?{ |column_item| element <= column_item }
  end
end