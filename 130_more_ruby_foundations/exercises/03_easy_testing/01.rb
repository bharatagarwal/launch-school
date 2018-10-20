require "minitest/autorun"  # => true

# method 1
Minitest::Test.new('Boolean').assert_equal(true, 15.odd?, 'value is not odd')  # => true

# method 2
class Test < Minitest::Test  # => Minitest::Test
  def test_boolean_pass
    value = 15               # => 15
    assert(value.odd?)       # => true
  end                        # => :test_boolean_pass

  def test_boolean_fail
    value = 16                               # => 16
    assert(value.odd?, 'value is not odd.')
  end                                        # => :test_boolean_fail
end                                          # => :test_boolean_fail

# method 3

def assert test, msg = nil
  unless test                                      # => true, false
    msg||= "Failure: Expected test to be truthy."  # => "Failure: Expected test to be truthy."
    puts msg
    return false                                     # => "Failure: Expected test to be truthy."
  end

  true  # => true
end     # => :assert

def test_boolean_pass
  value = 15           # => 15
  assert(value.odd?)   # => true
end                    # => :test_boolean_pass

def test_boolean_fail
  value = 16           # => 16
  assert(value.odd?)   # => "Failure: Expected test to be truthy."
end                    # => :test_boolean_fail

test_boolean_pass  # => true
test_boolean_fail  # => "Failure: Expected test to be truthy."

# >> Run options: --seed 6923
# >> 
# >> # Running:
# >> 
# >> F.
# >> 
# >> Finished in 0.001330s, 1503.7594 runs/s, 1503.7594 assertions/s.
# >> 
# >>   1) Failure:
# >> Test#test_boolean_fail [/Users/Bharat/launch-school/130_more_ruby_foundations/exercises/03_easy_testing/01.rb:15]:
# >> value is not odd.
# >> 
# >> 2 runs, 2 assertions, 1 failures, 0 errors, 0 skips