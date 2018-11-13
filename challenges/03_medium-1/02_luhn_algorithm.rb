class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    @number
    .digits
    .map.with_index do |value, index|
      if index.even?
        value
      else
        new_value = value * 2
        if new_value > 10
          new_value -= 9
        end

        new_value
      end
    end
    .reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    new_luhn = Luhn.new(number * 10)
    number_checksum = new_luhn.checksum

    if number_checksum % 10 == 0
      return number * 10
    else
      return number * 10 +
        (10 - number_checksum % 10)
    end
  end
end

Luhn.create(1213)
