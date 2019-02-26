# seeds -> plant in dirt -> grow plants

# growing: grass, clover, radishes and violets

# [window][window][window]
# ........................ (size 8?)
# ........................ (16 cups in all)#

# 12 children, 48 cups, 24 cups per row -> (3 windows?)

# children: 
# a, b, c, ... l

# [window]
# ..|.. ... ..
# ..|.. ... ..
# aa|bb ... ll

class Garden
  STUDENTS_DEFAULT = ["alice",
    "bob",
    "charlie",
    "david",
    "eve",
    "fred",
    "ginny",
    "harriet",
    "ileana",
    "joseph",
    "kincaid",
    "larry"
  ]

  PLANT_KEY = {
    "G" => :grass,
    "C" => :clover,
    "R" => :radishes,
    "V" => :violets
  }
  
  def initialize(string, students = nil)
    @rows = string.split("\n").map do|row| 
      row.split('')
    end
    
    @students = students ? 
      students.sort.map(&:downcase) : STUDENTS_DEFAULT
    
    create_name_methods
  end

  def create_name_methods
    @students.each do |student|
      self.class.define_method(student.to_sym) do
        plants_for(student)
      end
    end
  end

  def plants_for(student_name)
    index = @students.index(student_name.downcase)

    @rows.each_with_object([]) do |row, plants|
      plants_for_row = row[(2 * index)...( 2 * (index + 1) )]
      
      plants_for_row.each do |plant|
        plants << PLANT_KEY[plant]
      end
    end
  end
end