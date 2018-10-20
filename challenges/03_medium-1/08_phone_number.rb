# Write a program that cleans up user-en phone numbers so that they can be sent as SMS messages.
#
# The rules are as follows:
#
# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number
# Test suite:

# clean up numbers
# if length less than 9 || 11+, return '0' * 10
# if length is 11, reject if first is not 11. if first is 1, trim and return
# return number

class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = process(number)
  end

  def clean_up(number)
    number.chars.reduce('') do |number, character|
      character.match(/[0-9a-zA-Z]/) ? number + character : number
    end
  end

  def process(number)
    fail_num = '0' * 10
    return fail_num if number.chars.any? { |char| char.match(/[a-z]/i) }
    number = clean_up(number)
    return fail_num if number.length > 11 || number.length < 10

    if number.length == 11 && number[0] != '1'
      fail_num
    elsif number.length == 11
      number[1..-1]
    else
      number
    end
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..-1]}"
  end
end