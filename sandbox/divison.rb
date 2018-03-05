numerator = nil
denominator = nil

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

  loop do
    puts ">> Please enter the numerator: "
    numerator = gets.chomp
    break if valid_number?(numerator)
    puts ">> Invalid input. Only integers allowed."
  end

  loop do
    puts ">> Please enter the denominator: "
    denominator = gets.chomp
    puts ">> Invalid input. 0 not allowed." if denominator == '0'
    break if valid_number?(denominator) && denominator != '0'
    puts ">> Invalid input. Only integers allowed."
end

puts ">> #{numerator} / #{denominator} is #{numerator.to_i/denominator.to_i}"