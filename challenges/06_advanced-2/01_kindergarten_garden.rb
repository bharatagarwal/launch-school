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
  PLANT_KEY = {
    "G" => :grass,
    "C" => :clover,
    "R" => :radish,
    "V" => :violets
  }

FIRST_LETTER_ASCII = "a".ord # 97  
  
  def initialize(string)
    @rows = string.split("\n").map { |row| row.split('') }
  end

  def m
    self
  end

  def name(name)
    name_index = name[0].ord - FIRST_LETTER_ASCII
    @rows.each_with_object([]) do |row, plants|
      row[(2 * name_index)...( 2 * (name_index + 1) )].each do |plant|
        p plant
        plants << PLANT_KEY[plant]
      end
    end
  end
end

diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
garden = Garden.new(diagram)
garden.m # => #<Garden:0x00007fc44b933548 @rows=[["V", "R", "C", "G", "V", "V", "R", "V", "C", "G", "G", "C", "C", "G", "V", "R", "G", "C", "V", "C", "G", "C", "G", "V"], ["V", "R", "C", "C", "C", "G", "C", "R", "R", "G", "V", "C", "G", "C", "R", "V", "V", "C", "V", "G", "C", "G", "C", "V"]]>