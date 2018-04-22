ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

p ages.assoc("Spot")
p ages.has_key?("Spot")
p ages.fetch("Spot") rescue false
# KeyError: key not found
p ages.include?("Spot")

p ages.key?("Herman")

p ages.member?("Herman")

p ages.values_at("Spot")