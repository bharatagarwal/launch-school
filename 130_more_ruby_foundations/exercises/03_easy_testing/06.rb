require "minitest/autorun"

class NoExperienceError < StandardError; end

class Employee
  def initialize(experience = false)
    @experience = experience
  end

  def hire
    raise NoExperienceError unless @experience
    @hired = true
  end
end

class TestSuite < Minitest::Test
  def test_noexperienceerror
    assert_raises NoExperienceError do
      employee = Employee.new
      employee.hire
    end
  end
end
