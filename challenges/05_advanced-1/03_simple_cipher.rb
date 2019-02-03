class Cipher
  def initialize
  end
  
  def encode(string)
    string.chars.map do |char|
      (96 + (char.ord - 96 + 3) % 26).chr
    end.join
  end

  def decode(string)
    string.chars.map do |char|
      (96 + (char.ord - 96 - 3) % 26).chr
    end.join
  end
end

@cipher = Cipher.new
p @cipher.encode("iamapandabear")  # => "ldpds"
p @cipher.decode("ldpdsdqgdehdu")  # => "iamapandabear"