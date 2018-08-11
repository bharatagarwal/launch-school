class Person
  # @first_name = ''
  # @last_name = ''
  # these are of no use

  def initialize(first_name)
    @first_name = first_name
    @last_name = ''
  end

  def first_name
    @first_name
  end  

  def last_name
    @last_name
  end

  def last_name=(surname)
    @last_name = surname
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

bob = Person.new('Robert')

p bob.name

p bob.first_name

p bob.last_name

bob.last_name = 'Smith'

p bob.name
