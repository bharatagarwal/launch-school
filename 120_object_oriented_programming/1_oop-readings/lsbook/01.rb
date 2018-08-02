class GoodDog

  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  def self.what_am_i
    "I'm a GoodDog class"
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs')
p sparky.info
# fido = GoodDog.new("Fido")
# p fido.speak

p GoodDog.what_am_i