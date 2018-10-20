# ruby 2.0 onwards
def foo(bar: 'default')
  puts bar
end

foo
foo(bar: 'baz')

# pre ruby 2.0
def foo(options = {})
  bar = options.fetch(:bar, 'default')
  puts bar
end

# blocks with keyword arguments
define_method(:foo) do |bar: 'default'|
  puts bar
end

foo # 'default'
foo(bar: 'baz') # 'baz'

def foo(bar:)
  puts bar
end

# foo # ArgumentError
foo(bar: 'baz')

def mysterious_total(subtotal, tax, discount)
  subtotal + tax - discount
end

mysterious_total(100, 10, 5) # => 105

# >> default
# >> baz
# >> default
# >> baz
# >> baz

# Keyword arguments allow us to switch the order of the arguments, without affecting the behavior of the method:













