class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

p Pizza.new('Pepperoni')
p Fruit.new('Apple')

p Pizza.new('Pepperoni').instance_variables
p Fruit.new('Apple').instance_variables
