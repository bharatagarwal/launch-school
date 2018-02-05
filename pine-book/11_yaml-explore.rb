require 'yaml'

tic_tac_toe = [
              [0,1], [0,1], [0,1]
            ]

yamled_ttt = tic_tac_toe.to_yaml

puts '2D Array: '
puts yamled_ttt
puts

puts 'string: '
puts '42'.to_yaml
puts 'number: '
puts 42.to_yaml
puts 'binary: '
puts true.to_yaml