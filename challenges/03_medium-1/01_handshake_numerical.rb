require 'minitest/autorun'

class SecretHandshake
  HANDSHAKE = { 1000 => 'jump',
          100 => 'close your eyes',
          10 => 'double blink',
          1 => 'wink' }
  
  def initialize input
    if input.class == Integer
      @binary = input.to_s(2).to_i
    elsif input.class == String && valid_binary_string?(input)
      @binary = input.to_i
    else
      @binary = 0
    end
  end
    
  def commands
    @reversible = @binary / 10000 == 1 ? true : false
    @binary = @binary % 10000
    shake = []

    HANDSHAKE.each do |key, value|
      shake << value if  @binary / key == 1
      @binary = @binary % key
    end
    
    @reversible ? shake : shake.reverse
  end
  
  def valid_binary_string?(input)
    input.chars.all? {|char| char.match(/[01]/)}
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