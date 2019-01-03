class Triplet
  def initialize(first, second, third)
    @numbers = [first, second, third]
  end

  def sum
    @numbers.sum
  end

  def product
    @numbers.reduce(:*)
  end

  def pythagorean?
    a, b, c = @numbers.sort
    a**2 + b**2 == c**2
  end

  def self.where(options)
    min = options[:min_factor] || 1
    max = options[:max_factor]
    sum = options[:sum] # could be nil

    (min..max)
      .to_a
      .combination(3)
      .to_a
      .select do |a, b, c|
        (sum ? a + b + c == 180 : true) && new(a, b, c).pythagorean?
      end.map do |triplets| 
        Triplet.new(*triplets)
      end
  end
end
