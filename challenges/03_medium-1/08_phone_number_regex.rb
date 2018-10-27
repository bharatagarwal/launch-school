require 'pry'
# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1
# and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it
# is a bad number
# If the phone number is more than 11 digits assume that it is a bad number

# (987) 654-3210 => 9876543210
# 456.123.7890 => 4561237890
# 123-abc-1234 => 0*10
# 123456789    => 0*10
# 19876543210 => 9876543210
# 21234567890 => 0*10
# 1a2a3a4a5a6a7a8a9a0a => 0 * 10

# .number
# .area_code
# .to_s

# problem

# examples
# data structures
# algorithm

class PhoneNumber
  attr_reader :number, :area_code

  def initialize(input_string)
    @input_string = input_string
    @regex = /^\(?1?(\d{3})[).]?[ ]?(\d{3})[.-]?(\d{4})\b/i
    valid_input? ? process_input : @number = '0' * 10
  end

  def to_s
    "(#{@area_code}) #{@middle_three}-#{@final_four}"
  end

  private

  def valid_input?
    @regex.match(@input_string)
  end

  def process_input
    @area_code, @middle_three, @final_four = @input_string.scan(@regex).flatten
    @number = @area_code + @middle_three + @final_four
  end
end
