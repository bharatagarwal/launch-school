class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I'm a #{@type} cat?"
  end
end

p Cat.new('tabby').to_s