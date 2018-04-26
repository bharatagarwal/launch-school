#Create a hash that expresses the frequency with which each letter occurs in this string

statement = "The Flintstones Rock"

characters = statement.delete(' ').chars

character_count = {}

characters.each_with_object(character_count) do |char, hash|
  if hash[char] == nil
    hash[char] = 1
  else
    hash[char] += 1
  end
end

p character_count

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   p statement.scan(letter)
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# statement.scan('s') returns array like so ['s','s', 's']