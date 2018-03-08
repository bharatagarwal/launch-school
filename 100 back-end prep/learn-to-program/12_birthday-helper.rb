filename = 'birthdays.txt'

birthdays = File.read filename



birthdays = birthdays.split("\n")

deets = Array.new
bday = Hash.new

birthdays.each_with_index do |info, index|
  deets[index] = info
  while deets[index].include? "\t"
    deets[index].sub!("\t","")
  end 
  
  #splitting up date and year so age can be calculated as desired.
  deets[index] = deets[index].split(",")
  bday[deets[index][0]] = deets[index][1] + ", " + deets[index][2]
end

puts "Whose birthday do you want to find out?"
name = gets.chomp

found = 0


bday.each do |key, value|
  if name == key
    puts "This is the birthday: " + value
    found += 1
  end
end

if found == 0
  puts "Birthday not in database."
end