# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# problem
# parse input string, and convert consecutive non-alphanetical characters to a ' '

# data structure
# input: string
# reference array composed of two ranges for smallercase and uppercase


# algorithm
# make a two dimensional array
# keep adding to first element until alphabetical or not alphabetical
# upon change in state, add to new sub-array of main array
# replace non-alpha with ' '

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(string)
  alpha_non_alpha_groups = []
  characters = string.chars

  state = ALPHABETS.include?(characters.first)
  substring = ''

  characters.each_with_index do |char, index|
    # checks state, if state changes from previous letter, add substring to array and resets substring with char as first character.

    if state ==  ALPHABETS.include?(char) 
      substring << char   # if no state change, add to substring
    else
      alpha_non_alpha_groups << substring  # if state change, add substring to array
      substring = char # initate new substring
    end

    # for last substring
    if index == characters.length - 1
      alpha_non_alpha_groups << substring
    end

    state = ALPHABETS.include?(char)
  end

  alpha_space_groups = alpha_non_alpha_groups.map do |word| 
                        if !ALPHABETS.include?(word[0])
                          word = ' '
                        end
                        word
                      end

  alpha_space_groups.join('')
end

p cleanup("---what's my +*& line?")
p cleanup("---what's my +*& line?") == ' what s my line '