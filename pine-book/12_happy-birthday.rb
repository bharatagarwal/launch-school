puts "What year were you born in?"
year = gets.chomp.to_i

puts "What month were you born in?"
month = gets.chomp.to_i

puts "What date were you born on?"
date = gets.chomp.to_i

birth = Time.local(year, month, date)
age_in_seconds = (Time.new - birth).to_i
age_in_years = (age_in_seconds / (60*60*24*365.2425)).to_i

age_in_years.times { puts 'SPANK!'}