class Vehicle
end

class MyCar < Vehicle
  @OWNER = "NASCAR"
end

class MyTruck < MyCar
  @PURPOSE = "FARMING"
end

trucky = MyTruck.new
p trucky.PURPOSE