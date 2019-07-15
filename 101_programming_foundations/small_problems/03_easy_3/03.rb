# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# Please write word or multiple words: walk
# There are 4 characters in "walk".
# Please write word or multiple words: walk, don't run
# There are 13 characters in "walk, don't run".

def character_count(words)
  words = words.split(' ')
  words.reduce(0) { |sum, val| sum + val.length }
end

puts "Please write a word or multiple words: "
words = gets.chomp

puts "There are #{character_count(words)} characters in \"#{words}\"."

puts "Please write a word or multiple words: "
words = gets.chomp

puts "There are #{character_count(words)} characters in \"#{words}\"."

# say input = 'Please write word or multiple words'
# then input.delete(' ') == 'pleasewritewordormultiplewords'
# walk don't run