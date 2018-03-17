# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = {}

words.each do |word|
  # anagrams are have same value after their words have been split, sorted and put back together.
  key = word.split('').sort.join
  # add to existing key
  if anagrams.has_key?(key)
    anagrams[key].push(word) # value will be an array
  else
  # create new key value pair if none exist for the sorted word.
    anagrams[key] = [word] # will be initiation of an array
  end
end

p anagrams