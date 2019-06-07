# algorithm
# draw diagonals
# draw vertical and horizontal

# n = 9
#   0 1 2 3 4 5 6 7 8
# 0 *       *       *
# 1   *     *     *
# 2     *   *   *
# 3       * * *
# 4 * * * * * * * * *
# 5       * * *    
# 6     *   *   *
# 7   *     *     *
# 8 *       *       *

def initiate_nested_array(n)
  nested_array = []
  n.times do
    nested_array << (' ' * n).split('')
  end

  nested_array
end

def vertical_and_horizontal(nested_array)
  center_index = (nested_array.length - 1)/2

  # horizontal
  nested_array[center_index].map! {|char| char = '*'}

  # vertical
  nested_array.each do |array|
    array[center_index] = '*'
  end

  nested_array
end

def diagonals(nested_array)
  nested_array.each_with_index do |array, outer_index|
 
    # left to right diagonal
    array[outer_index] = '*'

    # right to left diagonal
    array[(nested_array.size - 1) - outer_index] = '*'
  end

  nested_array
end

def display_nested_array(nested_array)
  nested_array.each do |array|
    puts array.reduce(''){ |sum, char| sum + char}
  end
end

n = 0
loop do
  puts "What size grid do you want to work with?"
  puts "Enter an odd number >= 7"
  n = gets.chomp.to_i
  break if n >= 7 && n.odd?
  puts "Please enter a valid number."
end

nested_array = initiate_nested_array(n)

vertical_and_horizontal(nested_array)
diagonals(nested_array)

display_nested_array(nested_array)