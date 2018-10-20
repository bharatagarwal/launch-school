require "minitest/autorun"  # => true

class TestSuite < Minitest::Test       # => Minitest::Test
  def test_name
    value = Numeric.new                # => #<Numeric:0x00007f80e919c0f0>
    assert_instance_of Numeric, value  # => true
  end                                  # => :test_name
end                                    # => :test_name

# Object#instance_of?

# >> Run options: --seed 3692
# >> 
# >> # Running:
# >> 
# >> .
# >> 
# >> Finished in 0.001172s, 853.2423 runs/s, 853.2423 assertions/s.
# >> 
# >> 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips