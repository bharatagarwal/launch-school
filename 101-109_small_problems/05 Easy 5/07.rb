# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def word_sizes(string)
  distribution = {}
  
  words = string.split(' ')

  words.each do |word|

    word = word.chars.select {|char| ALPHABETS.include?(char)}.join('')
    # use delete instead.

    if distribution.has_key?(word.size)
      distribution[word.size] += 1
    else
      distribution[word.size] = 1
    end
  end

  distribution
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
