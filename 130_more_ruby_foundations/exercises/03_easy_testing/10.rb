require "minitest/autorun"  # => true

class TestSuite < Minitest::Test  # => Minitest::Test
  def test_name
    list = [1, 2, 'xy']           # => [1, 2, "xy"]
    refute_includes(list, 'xyz')  # => false
  end                             # => :test_name
end                               # => :test_name

# >> Run options: --seed 44666
# >> 
# >> # Running:
# >> 
# >> .
# >> 
# >> Finished in 0.001158s, 863.5579 runs/s, 1727.1157 assertions/s.
# >> 
# >> 1 runs, 2 assertions, 0 failures, 0 errors, 0 skips