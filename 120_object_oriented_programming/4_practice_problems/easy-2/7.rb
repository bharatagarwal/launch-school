class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# keeps a count of the number of instances created of class Cat. Every time it's called, it increments by 1, and start with a value of 0.

Cat.new('kitty')
Cat.new('black')
p Cat.cats_count