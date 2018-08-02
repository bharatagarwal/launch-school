# Write a method that returns all the substring in a string

def substring(string, beginning_index, ending_index = beginning_index)
  string[beginning_index..ending_index]
end


def substrings(word)
  substrings_list = []
  
  starting_index = 0
  size = word.length

  while starting_index <= size - 2
    ((starting_index+ 1)..(size-1)).each do |ending_index|
      substrings_list << substring(word, starting_index, ending_index)
    end
    starting_index += 1
  end

  substrings_list
end

def palindromes_within_string(string)
  substrings(string).select do |word|
    word.downcase == word.downcase.reverse
  end
end

def largest_palindrome(string)
  palindromes_within_string(string).reduce('') do |largest, word|
    if word.size > largest.size
      word
    else
      largest
    end
  end
end

p substrings('band') == %w(ba ban band an and nd)
p substrings('world') == %w(wo wor worl world or orl orld rl rld ld)
p substrings('ppop') == %w(pp ppo ppop po pop op)

p palindromes_within_string('ppop') == ['pp', 'pop']
p largest_palindrome('ppop')
p largest_palindrome('madam')