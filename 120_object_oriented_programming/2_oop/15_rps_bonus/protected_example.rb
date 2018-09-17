class Animal
  def initialize n, a
    @name = n
    @age = a
  end

  def namer_than other_animal
    name > other_animal.name
  end

  def ager_than other_animal
    age > other_animal.age
  end

  def say_wait
    puts "wait!"
  end
  
  protected

  def age
    @age
  end

  def say_bye
    puts "bye!"
  end

  private

  def name
    @name
  end

  def say_hi
    puts "hi!"
  end
end

class Human < Animal
  def initialize
    say_hi
    say_bye
    say_wait
  end
end

flava = Animal.new('flava flav', 11)
demo = Animal.new('demosthenes', 74)

Human.new

p flava.ager_than demo
p flava.namer_than demo

