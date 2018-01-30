foods = ['tacos', 'burritos', 'bed','chimichangas', 'sopapillas', 'flautas']
wets_bed = nil

def ask question
  while true
    puts question
    reply = gets.chomp.downcase

    if (reply == 'yes' || reply == 'no')
      if reply == 'yes'
        answer = true
      else
        answer = false
      end
      break
    else
      puts "Please answer 'yes' or 'no'."
    end
  end

  answer
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