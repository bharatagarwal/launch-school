class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # NoMethodError
tv.model # will execute the logic in instance method `model`

Television.manufacturer # will execute the logic in class method `manufacturer`
Television.model # NoMethodError