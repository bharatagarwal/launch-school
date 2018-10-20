require "minitest/autorun"

class TestSuite < Minitest::Test
  def test_nil_pass
    value = nil
    assert_nil value
  end

  def test_nil_fail
    value = :something
    assert_nil value
  end
end

# method 2

def assert test
  return false unless test
  true
end

def assert_nil obj
  assert(obj.nil?)
end

p assert_nil(nil)