require "minitest/autorun"

# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

class StringTest < Minitest::Test
  def test_xyz
    value = 'xYz'
    assert_equal('xyz', value.downcase)
  end
end

# method 2
def assert test, msg = nil
  return false unless test
  true
end

def assert_equal exp, act, msg = nil
  assert(exp == act)
end

p assert_equal('xyz','xYz'.downcase)