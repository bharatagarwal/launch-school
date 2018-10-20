
```
class Identity
  def initialize(name, age)
    @name = name
    @age = age
    create_id_number
  end

  def id_number
    'XXXXXX' + @id_number[-3..-1]
  end

  def greater_id_number(other)
    id > other.id
  end

  protected

  def id
    @id_number.to_i
  end

  def create_id_number
    @id_number = rand(100..999).to_s + rand(100..999).to_s +
                + rand(100..999).to_s
  end  
end

p Identity.new('Bharat', 28).id_number
```