def my_method
  yield(3)     # => "3"
end            # => :my_method

a_proc = :to_s.to_proc  # => #<Proc:0x00007fbe0c8cddc8(&:to_s)>
my_method(&a_proc)      # => "3"