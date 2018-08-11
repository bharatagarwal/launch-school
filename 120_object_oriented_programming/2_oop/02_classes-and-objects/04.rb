require 'pry'

class Person

  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split

    if parts.size > 1
      @first_name = parts.first
      @last_name = parts.last
    else
      @first_name = parts.first
      @last_name = ''
    end
  end

end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name == rob.name
