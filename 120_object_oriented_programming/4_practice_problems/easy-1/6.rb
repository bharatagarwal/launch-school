class Cube
  # attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end
end

p Cube.new(44).instance_variable_get('@volume')
puts Cube.new(44)