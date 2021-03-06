# Write a small archiving program that stores students' names along with the grade that they are in.

# In the end, you should be able to:

# Add a student's name to the roster for a grade
# "Add Jim to grade 2."
# "OK."
# Get a list of all students enrolled in a grade
# "Which students are in grade 2?"
# "We've only got Jim just now."
# Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.

# {1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
# The exact output format doesn't matter: what's important is that it shows all of the students and grades in the proper order.

# Note that all our students only have one name. (It's a small town, what do you want?)

class School
  def initialize
    @students = Hash.new([])
  end

  def add(name, grade)
    if @students[grade].empty?
      @students[grade] = [name]
    else
      @students[grade] << name
    end
  end

  def grade(number)
    @students[number]
  end

  def to_h
    @students = @students.sort_by { |k, v| k }.to_h

    @students.each do |k, v|
      v.sort!
    end

    @students
  end
end
