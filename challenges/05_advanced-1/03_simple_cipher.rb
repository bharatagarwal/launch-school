# 'a'.ord # => 97
# 'z'.ord # => 122

class Cipher
  attr_reader :key
  def initialize(key=nil)
    raise ArgumentError if key && key.match(/[A-Z0-9]/)
    raise ArgumentError if key == ''

    if key
      @key = key
    else
      @key = ''
      100.times { @key << (97..122).to_a.sample.chr }
    end
  end
  
  def encode(string)
    string.chars.map.with_index do |char, index|
      delta = @key[index].ord - 97
      if char.ord + delta < 123
        (char.ord + delta).chr
      else
        (char.ord + delta - 26).chr
      end
    end.join
  end

  def decode(string)
    string.chars.map.with_index do |char, index|
      delta = @key[index].ord - 97
      if char.ord - delta > 96 
        (char.ord - delta).chr
      else
        (char.ord + 26 - delta).chr
      end
    end.join
  end
end