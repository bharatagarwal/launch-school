require "minitest/autorun"  # => true

class TestSuite < Minitest::Test  # => Minitest::Test
  def test_xyz
    list = ['abc', 'xyz']         # => ["abc", "xyz"]
    assert_includes list, 'xyz'   # => true
  end                             # => :test_xyz
end                               # => :test_xyz

# method 2

def assert test
  return false unless test  # => true, true
  true                      # => true, true
end                         # => :assert

def assert_includes collection, object
  assert(collection.respond_to?(:include?))  # => true
  assert(collection.include?(object))        # => true
end                                          # => :assert_includes


list = ['abc', 'xyz']          # => ["abc", "xyz"]
p assert_includes list, 'xyz'  # => true

# >> true
# >> Run options: --seed 26747
# >> 
# >> # Running:
# >> 
# >> .
# >> 
# >> Finished in 0.001046s, 956.0229 runs/s, 1912.0459 assertions/s.
# >> 
# >> 1 runs, 2 assertions, 0 failures, 0 errors, 0 skips