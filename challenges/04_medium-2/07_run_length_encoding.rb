require 'pry'

# Implement run-length encoding and decoding.

# Run-length encoding (RLE) is a simple form of data compression, where runs (consecutive data elements) are replaced by just one data value and count.

# For example we can represent the original 53 characters with only 13.

# RLE allows the original data to be perfectly reconstructed from the compressed data, which makes it a lossless data compression.

# problem
# ---

# run is 'consecutive data elements'
# input: alphabet characters

# examples
# ---
# 
# "AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"
# "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"

# {number of occurances}(alphabet itself)

# data structures
# ----
# input: string, create an array of characters

# algorithm
# -----

# AABBBCCCC
# (A)ABBBCCCC | previous '', current_count = 1
# A(A)BBBCCCC | previous A, current_count = 2
# AA(B)BBCCCC | previous A, current_count = 1
# append to result string
# AAB(B)BCCCC | previous B, current_count = 2
# AABB(B)CCCC | previous B, current_count = 3
# AABBB(C)CCC | previous B, current_count = 1
# append to result string
# AABBBC(C)CC | previous C, current_count = 2
# AABBBCC(C)C | previous C, current_count = 3
# AABBBCCC(C) | previous C, current_count = 4
# append to result string

# next if index == 1

# append to previous

module RunLengthEncoding
  def self.encode(input)
    return input if input.length == 1

    count = 1
    previous_char = input.chars.first
    encoded_string = ''

    input.chars.each_with_index do |char, index|
      next if index == 0

      if char != previous_char
        encoded_string << "#{count == 1 ? '' : count}#{previous_char}"
        encoded_string << char if index == input.length - 1
        count = 1
      else
        count += 1
        encoded_string << "#{count == 1 ? '' : count}#{char}" if index == input.length - 1
      end

      previous_char = char
    end

    encoded_string
  end
  
  def self.decode(input)
    count_char_pairs = input.scan(/([0-9]*)([^0-9])/)

    count_char_pairs.map! do |pair|
      if pair.first == ''
        [1, pair.last]
      else
        [pair.first.to_i, pair.last]
      end
    end

    count_char_pairs.each_with_object('') do |(count, char), string|
      count.times { string << char }
    end
  end
end