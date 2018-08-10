class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end


  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new('Joe', 97)
bob = Student.new('Bob', 90)

p joe
p bob
# p joe.grade

puts "Well done!" if joe.better_grade_than?(bob)