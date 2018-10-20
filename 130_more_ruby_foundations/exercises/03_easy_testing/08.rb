# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

require "minitest/autorun"  # => true

class TestSuite < Minitest::Test   # => Minitest::Test
  def test_name
    value = 5                      # => 5
    assert_kind_of Numeric, value  # => true
  end                              # => :test_name
end                                # => :test_name

# >> Run options: --seed 34290
# >> 
# >> # Running:
# >> 
# >> .
# >> 
# >> Finished in 0.001186s, 843.1703 runs/s, 843.1703 assertions/s.
# >> 
# >> 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips