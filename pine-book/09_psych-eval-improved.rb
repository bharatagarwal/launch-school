foods = ['tacos', 'burritos', 'bed','chimichangas', 'sopapillas', 'flautas']
wets_bed = nil

def ask question
  while true
    puts question
    reply = gets.chomp.downcase

    if (reply == 'yes' || reply == 'no')
      if reply == 'yes'
        return true
      else
        return false
      end
    break
    else
      puts "Please answer 'yes' or 'no'."
    end
  end
end

puts "Hello, and thank you for..."
puts

foods.each do |food|
  if
    food == 'bed'
    wets_bed = ask "Do you wet the bed?"
  else
    ask "Do you eat #{food}?"
  end
end


puts 'DEBRIEFING'
puts 'Thank you for ...'
puts
puts wets_bed