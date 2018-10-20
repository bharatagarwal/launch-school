require "minitest/autorun"
require_relative '08_phone_number_regex'

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

require 'minitest/autorun'

class PhoneNumberTest < Minitest::Test
  def test_cleans_number
    number = PhoneNumber.new('(123) 456-7890').number
    assert_equal '1234567890', number
  end

  def test_cleans_a_different_number
    # skip
    number = PhoneNumber.new('(987) 654-3210').number
    assert_equal '9876543210', number
  end

  def test_cleans_number_with_dots
    # skip
    number = PhoneNumber.new('456.123.7890').number
    assert_equal '4561237890', number
  end

  def test_invalid_with_letters_in_place_of_numbers
    # skip
    number = PhoneNumber.new('123-abc-1234').number
    assert_equal '0000000000', number
  end

  def test_invalid_when_9_digits
    # skip
    number = PhoneNumber.new('123456789').number
    assert_equal '0000000000', number
  end

  def test_valid_when_11_digits_and_first_is_1
    # skip
    number = PhoneNumber.new('19876543210').number
    assert_equal '9876543210', number
  end

  def test_valid_when_10_digits_and_area_code_starts_with_1
    # skip
    number = PhoneNumber.new('1234567890').number
    assert_equal '1234567890', number
  end

  def test_invalid_when_11_digits
    # skip
    number = PhoneNumber.new('21234567890').number
    assert_equal '0000000000', number
  end

  def test_invalid_when_12_digits_and_first_is_1
    # skip
    number = PhoneNumber.new('112345678901').number
    assert_equal '0000000000', number
  end

  def test_invalid_when_10_digits_with_extra_letters
    # skip
    number = PhoneNumber.new('1a2a3a4a5a6a7a8a9a0a').number
    assert_equal '0000000000', number
  end

  def test_area_code
    # skip
    number = PhoneNumber.new('1234567890')
    assert_equal '123', number.area_code
  end

  def test_different_area_code
    # skip
    number = PhoneNumber.new('9876543210')
    assert_equal '987', number.area_code
  end

  def test_pretty_print
    # skip
    number = PhoneNumber.new('5551234567')
    assert_equal '(555) 123-4567', number.to_s
  end

  def test_pretty_print_with_full_us_phone_number
    # skip
    number = PhoneNumber.new('11234567890')
    assert_equal '(123) 456-7890', number.to_s
  end
end
