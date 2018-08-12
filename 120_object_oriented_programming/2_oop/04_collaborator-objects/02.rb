class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

joe = Person.new('Bob')
p joe
p joe.name

