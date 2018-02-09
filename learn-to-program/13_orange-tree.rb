class Tree

  def initialize
    @height = 1
    @oranges = 0
    @age = 0
  end

  def height
    puts "Your tree is #{@height} ft high."
  end

  def count_oranges
    puts "Your tree has #{@oranges} oranges."
  end

  def pick_an_orange
    if @oranges > 0
      puts "Yum! That was tasty."
      @oranges-= 1
      puts "You have #{@oranges} oranges left."
    else
      puts "Sorry! Out of oranges."
    end
  end

  def one_year_passes
    @age+= 1
    @oranges = 0

    if @age >=0 && @age <2
      @height+=2
      puts "Your tree is #{@age} years old now."
      puts "Height grew by 2 ft to #{@height} ft."
      puts "Oranges will grow soon. Wait for "+ (2 - @age).to_s + " years."
    elsif @age >=2 && @age <9
      @height+=1
      @oranges+=7
      puts "Height grew by 1 ft to #{@height} ft."
      puts "You have #{@oranges} oranges now."
    elsif @age >=9 && age<12
      @oranges += (10) + (age-9)
      puts "You have #{@oranges} oranges now."
    elsif @age >= 12
      puts "Sorry, your tree has died."
    end
  end
end

oranje = Tree.new
oranje.height
oranje.pick_an_orange
oranje.one_year_passes
oranje.pick_an_orange
oranje.one_year_passes
oranje.one_year_passes
oranje.one_year_passes

oranje.pick_an_orange