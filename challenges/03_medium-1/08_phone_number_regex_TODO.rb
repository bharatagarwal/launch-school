class PhoneNumber
  attr_reader :number

  def initialize(number)
    
  end

  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..-1]}"
  end
end