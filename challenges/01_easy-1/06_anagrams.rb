# Anagrams
# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

# problem
# identify if anagram of given word exists in given word list.
# return list of words which are anagrams of that word.

# anagram has to be of same length, and should not be fooled by repetition
# anagram is case sensitive
# anagram is not identical word
# skip anagrams with same checksum

# data structures

# provided
# string reference word
# array word list

# algorithm
# select from given array
# remove case
# skip if same word or if checksum matches
# create word hash of original
# compare with word hash of original
# if word hashes match, then allow element to be selected
# return selected word

# keep popping and see if both are empty together.


class Anagram
  def initialize(given_word)
    @word = given_word
  end

  def match(words)
    words.select { |word| anagram?(word, @word) }
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    compare_words3(word1, word2)
  end

  def compare_words2(word1, word2)
    word1.downcase.chars.sort == word2.downcase.chars.sort
  end

  def compare_words3(word1, word2)
    chars1, chars2 = word1.downcase.chars, word2.downcase.chars
    ref_chars1 = chars1.clone

    chars1.each do |char|
      ref_chars1.delete_at(ref_chars1.index(char))
      other_index = chars2.index(char)
      return false unless other_index
      chars2.delete_at(other_index)
    end

    ref_chars1.empty? && chars2.empty?
  end

  def compare_words(word1, word2)
    create_word_hash(word1) == create_word_hash(word2)
  end
  
  def create_word_hash(word)
    word.downcase.chars.each_with_object({}) do |char, hash| 
          hash[char] ? hash[char] += 1 : hash[char] = 1
    end
  end
end