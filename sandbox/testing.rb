require 'minitest/autorun'  # => true

class Car
  attr_accessor :name, :wheels  # => nil

  def initialize
    @wheels = 4   # => 4, 4
  end             # => :initialize

  def ==(other)
    other.is_a?(Car) && name == other.name  # => true
  end                                       # => :==
end                                         # => :==

class CarTest < MiniTest::Test  # => Minitest::Test
  def test_value_equality
    car1 = Car.new              # => #<Car:0x00007fa5f2865278 @wheels=4>
    car2 = Car.new              # => #<Car:0x00007fa5f2864238 @wheels=4>

    car1.name = 'Kim'  # => "Kim"
    car2.name = 'Kim'  # => "Kim"

    assert_equal car1, car2  # => true
  end                        # => :test_value_equality
end                          # => :test_value_equality

# >> Run options: --seed 46265
# >> 
# >> # Running:
# >> 
# >> .
# >> 
# >> Finished in 0.002169s, 461.0420 runs/s, 461.0420 assertions/s.
# >> 
# >> 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
