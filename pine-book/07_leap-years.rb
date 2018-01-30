puts "Starting year: "
start_year = gets.chomp

puts "Ending year: "
end_year = gets.chomp

year = start_year.to_i

while year <= end_year.to_i
  if year % 4 == 0
    if year % 100 != 0
      puts year.to_s + ' is a leap year'
    elsif year % 400 == 0
      puts year.to_s + ' is a leap year'
    end
  end
  year = year + 1
end 
