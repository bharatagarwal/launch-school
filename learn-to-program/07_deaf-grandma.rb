bye_count = 0

while true

  print "Say something: "
  said = gets.chomp

  if said == 'BYE'
    bye_count = bye_count + 1
  else
    bye_count = 0
  end

  if bye_count >=3
    break
  end

  if said == said.upcase
    year = 1930 + rand(21)
    puts "NO, NOT SINCE " + year.to_s + "!"
  else
    puts "HUH! SPEAK UP, SONNY!"
  end
end
