number = nil

loop do
  loop do
    puts ">> How many output lines do you want? Enter a number >= 3:"
    number = gets.chomp
    break if number.to_i >= 3 || number.downcase == 'q  '
    puts ">> That's not enough lines."
  end
  number.to_i.times { puts "Launch School is the best!"}
  break if number.downcase == 'q'
end
