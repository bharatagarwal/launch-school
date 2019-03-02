# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# A collection of spelling blocks has two letters per block.
# use each block only once, and cannot use both letters in the block.
# block_word?(string) # => boolean

# problem
# ---

# input: string
# output: boolean
# create a data structure to store block
# for each block, we need to keep track of single use, and the fact
# that the block only one of them is used.

# {
#     ['B', 'O'] => 0
# }

# algorithm
# iterate through every word in the sentence
# find index from keys, and return the key
# return false if values.any? > 0
# return true at the end of the loop

def block_word?(string)
  word_hash = {
    ['B','O'] => 0, 
    ['X','K'] => 0, 
    ['D','Q'] => 0, 
    ['C','P'] => 0, 
    ['N','A'] => 0, 
    ['G','T'] => 0, 
    ['R','E'] => 0, 
    ['F','S'] => 0, 
    ['J','W'] => 0, 
    ['H','U'] => 0, 
    ['V','I'] => 0, 
    ['L','Y'] => 0, 
    ['Z','M'] => 0
  }
  
  string.upcase.chars.each do |char|
    relevant_block = word_hash.keys.select do |pair|
      pair.include?(char)
    end.first
    
    word_hash[relevant_block] += 1
    return false if word_hash[relevant_block] == 2
  end

  true  
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true