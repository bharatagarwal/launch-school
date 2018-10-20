require "minitest/autorun"

class TestSuite < Minitest::Test
  def test_name
    list = []
    assert_empty list
  end
end

# method 2

def assert test
  return false unless test
  true
end

def assert_empty list
  assert(list.respond_to?(:empty?))
  assert(list.empty?)
end

list = []
p assert_empty list