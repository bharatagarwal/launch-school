class Human
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def older_than(other)
    age > other.age
  end
end

class Family
  def initialize
    @me = Human.new('Foobaz', 30)
    @father = Human.new('Barfoo', 60)
  end

  def start
    me.name
    me.older_than(father)
  end
end
