class SuperClass
  attr_accessor :inheritors
  @inheritors = 0

  def self.total_inheritors
    "Total number of inheritors: #{@inher}"
  end
end

class SubClass < SuperClass
  def initialize
    @inheritors += 1
  end
end

sub = SubClass.new
sub2 = SubClass.new
SuperClass.total_inheritors