class MyCar

  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
  end

  def accelerate(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now #{@speed} mph."
  end

  def shut_down
    @speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(new_colour)
    self.color = new_colour
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
   "This is a #{@model} that was made in #{year} and it's #{color} in color"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.spray_paint('blue')

MyCar.gas_mileage(13, 351)
puts lumina