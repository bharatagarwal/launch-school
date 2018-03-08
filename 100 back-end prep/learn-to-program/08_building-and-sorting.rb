# type as many words as you want, continuing until you press Enter.
# repeat your words back in an alphabetical order. Use array method 'sort'

words = []

while true
  puts "Say something: "
  words.push(gets.chomp)
  if words.last == ''
    words.pop
    break
  end
end

if words.length != 0
  words.sort!
  puts "Your words in alphabetical order: "
  puts words
else
  puts "You gotta say something!"
end