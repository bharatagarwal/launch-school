class Human
  attr_reader :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end

  def older_than(other)
    age > other.age
  end
end

def family_details
  me = Human.new('Sam', 17)
  dad = Human.new('Mark', 49)

  dad.older_than(me)
end

family_details

# #INDEX: 1
# SYNTAX TREE: 
# (send
#   (const nil :Human) :new
#   (str "Sam")
#   (int 17))
# #INDEX: 2
# SYNTAX TREE: 
# (send
#   (const nil :Human) :new
#   (str "Mark")
#   (int 49))
# #INDEX: 3
# SYNTAX TREE: 
# (send
#   (lvar :dad) :older_than
#   (lvar :me))

class DrivingSchool
  def initialize
    instructor = Human.new('John', 41)
    student = Human.new('Gabe', 16)
  end

  def eligible_to_drive(person)
    person.age >= 18
  end

  def test
    instructor.older_than(student)
    eligible_to_drive(student) 
  end
end

# #INDEX: 1
# SYNTAX TREE: 
# (send
#   (send nil :instructor) :older_than
#   (send nil :student))
# #INDEX: 2
# SYNTAX TREE: 
# (send nil :instructor)
# #INDEX: 3
# SYNTAX TREE: 
# (send nil :student)
# #INDEX: 4
# SYNTAX TREE: 
# (send nil :eligible_to_drive
#   (send nil :student))
# #INDEX: 5
# SYNTAX TREE: 
# (send nil :student)
# "conditions: 0"


