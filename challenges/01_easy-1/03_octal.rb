# Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

# Note:

# Implement the conversion yourself. Do not use something else to perform the conversion for you. Treat invalid input as octal 0.

# About Octal (Base-8):

# Decimal is a base-10 system.

# A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

# The rightmost digit gets multiplied by 100 = 1
# The next number gets multiplied by 10**1 = 10
# ...
# The n*th number gets multiplied by 10**(n-1).
# All these values are summed.

# 233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100 + 3*10 + 3*1

# 233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

# problem
# take input in the form of a string octal number
# check for its octal validity
# convert octal number to a decimal number.

# examples
# 10 => 8
# 10
# 1*8^1 + 0*8^0
# 130 => 88
# 1 * 8^2 + 3 * 8^1 + 0 * 8^0
# 64 + 24
# 88

# 7777 => 4095
# 7 * 8^3 + 7 * 8^2 + 7 * 8^1 + 7 * 8^0
# 512 * 7 + 64 * 7 + 8 * 7 + 7
# 3584 + 448 + 56 + 7
# 4095

# 011 => 9
# octal numbers are only valid if the characters have values from 0-7.
# 6789 => 0 (invalid)

# 8
# 8 * 8^0 == 8

# 6789
# 6 * 8^3 + 7 * 8^2 + 8 * 8^1 + 9 * 8^0
# why?

# data structures
# input: string
# validation via regex
# output: digit

# algorithm
# map over reversed octal digit character, and multiply each with 8^index
# reduce value down to sum.

class Octal
  def initialize string
    @string = valid_string?(string) ? string : 0
  end

  def to_decimal
    return 0 if @string == 0

    @string
      .chars
      .reverse
      .map.with_index { |char, index| char.to_i * 8**index }
      .sum
  end

  private

  def valid_string? string
    string.match(/\b[0-7]+\b/)
  end
end
