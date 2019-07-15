# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# problem
# data structures
# algorithm

def swap(string)
  words = string.split(' ')
  words.map! do |word|
    if word.length > 1
      last_index = word.length - 1
      buffer = word[0]

      word[0] = word[last_index]
      word[last_index] = buffer
    end

    word
  end
  words.join(' ')
end

# parallel assignment
# def first_last_swap(word)
#   word[0], word[-1] = word[-1], word[0]
# end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'