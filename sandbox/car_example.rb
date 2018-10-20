class Car
  WHEELS = 4  # => 4

  def wheels
    WHEELS  # => 4, 2
  end                   # => :wheels
end                     # => :wheels

class Motorcycle < Car  # => Car
  WHEELS = 2            # => 2

  def wheels
    WHEELS  # => 4, 2
  end                   # => :wheels
end                     # => 2

Car.new.wheels         # => 4
Motorcycle.new.wheels  # => 2