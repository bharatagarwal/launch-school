class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new

hello.hi # putses "Hello" to screen
hello.bye # NoMethodError
hello.greet # ArgumentError
hello.greet("Goodbye") # putses "Goodbye" to screen
Hello.hi # NoMethodError
