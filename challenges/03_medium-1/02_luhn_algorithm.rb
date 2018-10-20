class Luhn
  def initialize(number)
    @number = number      # => 12130
  end                     # => :initialize

  def addends
    @number                            # => 12130
    .digits                            # => [0, 3, 1, 2, 1]
    .map.with_index do |value, index|  # => #<Enumerator: [0, 3, 1, 2, 1]:map>
      if index.even?                   # => true, false, true, false, true
        value                          # => 0, 1, 1
      else
        new_value = value * 2          # => 6,     4
        if new_value > 10              # => false, false
          new_value -= 9
        end                            # => nil, nil

        new_value  # => 6, 4
      end          # => 0, 6, 1, 4, 1
    end            # => [0, 6, 1, 4, 1]
    .reverse       # => [1, 4, 1, 6, 0]
  end              # => :addends

  def checksum
    addends.sum  # => 12
  end            # => :checksum

  def valid?
    checksum % 10 == 0
  end                   # => :valid?

  def self.create(number)
    new_luhn = Luhn.new(number * 10)     # => #<Luhn:0x00007fad910d9738 @number=12130>
    number_checksum = new_luhn.checksum  # => 12

    if number_checksum % 10 == 0         # => false
      return number * 10
    else
      return number * 10 +               # => 12130
            (10 - number_checksum % 10)  # => 12138
    end
  end                                    # => :create
end                                      # => :create

Luhn.create(1213)  # => 12138