class Foo
  def self.bar
    p self
  end

  def baz
    p self
  end
end

Foo.bar
Foo.new.baz
p self