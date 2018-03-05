class MyClass

  def self.class_inspect_self
    p self
  end

  def self.announce_and_inspect_self
    puts "Reporting for inspection!"
    class_inspect_self
  end

  def inspect_self
    p self
  end

end

MyClass.announce_and_inspect_self