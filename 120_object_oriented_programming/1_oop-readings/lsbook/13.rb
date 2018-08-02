class Parent
  def say_hi
    p "Hi from Parent."
  end
end

class Child < Parent
  def say_hi
    p "Hi, from Child."
  end

  def send
    p "send from Child..."
  end
end

lad = Child.new
lad.send