

def block_word?(word)
  
  block = {
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

  word.upcase.chars.each do |char|
    block.each do |block_pair, count|
      if block_pair.include?(char)
        p char
        p block_pair
        block[block_pair] += 1
      end
      return false if block[block_pair] > 1
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true