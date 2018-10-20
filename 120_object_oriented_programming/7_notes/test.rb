module Nameable
  @name = ''

  def set_name(name)
    @name = name
  end
end

class Animal
  attr_reader :name
  include Nameable
end

bharat = Animal.new
bharat.set_name('Bharat')
p bharat