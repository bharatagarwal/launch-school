class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# If we have the class below, what would you need to call to create a new instance of this class.

p Bag.new(:blue, :suede)