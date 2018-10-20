# 1001
# [wink, jump]

# 11001
# [jump, wink]

# check for reversibility, remove 10000 from string if present.
# reverse binary and
# iterate over array and check if binary_char is 1
# add to message if true
# reverse message if original bin_number is reversible.

require 'minitest/autorun'

class SecretHandshake
  HANDSHAKE = ['wink', 'double blink', 'close your eyes', 'jump']
  
  def initialize input
    if input.class == Integer
      @binary = input.to_s(2)
    elsif input.class == String && valid_binary_string?(input)
      @binary = input
    else
      @binary = '0'
    end

    @binary_chars = @binary.chars
  end
    
  def commands
    message = []
    reversibility = check_reversibility
    
    @binary_chars.shift if reversibility

    @binary_chars.reverse.each_with_index do |binary_char, index|
      message << HANDSHAKE[index] if binary_char == '1'
    end

    reversibility ? message.reverse : message
  end

  private
  
  def valid_binary_string?(input)
    input.match(/[01]+/)
  end

  def check_reversibility
    @binary_chars.size == 5 && @binary_chars[0] == '1'
  end
end

class SecretHandshakeTest < Minitest::Test
  def test_handshake_1_to_wink
    # skip
    handshake = SecretHandshake.new(1)
    assert_equal ['wink'], handshake.commands
  end

  def test_handshake_10_to_double_blink
    # skip
    handshake = SecretHandshake.new(2)
    assert_equal ['double blink'], handshake.commands
  end

  def test_handshake_100_to_close_your_eyes
    # skip
    handshake = SecretHandshake.new(4)
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_handshake_1000_to_jump
    # skip
    handshake = SecretHandshake.new(8)
    assert_equal ['jump'], handshake.commands
  end

  def test_handshake_11_to_wink_and_double_blink
    # skip
    handshake = SecretHandshake.new(3)
    assert_equal ['wink', 'double blink'], handshake.commands
  end

  def test_handshake_10011_to_double_blink_and_wink
    handshake = SecretHandshake.new(19)
    assert_equal ['double blink', 'wink'], handshake.commands
  end

  def test_handshake_11111_to_double_blink_and_wink
    # skip
    handshake = SecretHandshake.new(31)
    expected = ['jump', 'close your eyes', 'double blink', 'wink']
    assert_equal expected, handshake.commands
  end

  def test_valid_string_input
    # skip
    handshake = SecretHandshake.new('1')
    assert_equal ['wink'], handshake.commands
  end

  def test_invalid_handshake
    # skip
    handshake = SecretHandshake.new('piggies')
    assert_equal [], handshake.commands
  end
end